const http = require('http');
const https = require('https');
const url = require('url');
const crypto = require('crypto');
require('dotenv').config();

const PORT = process.env.PORT || 3000;
const AMAP_REST_KEY = process.env.AMAP_REST_KEY || process.env.AMAP_KEY;
const AMAP_SK = process.env.AMAP_SK || '';

function md5(text){
  return crypto.createHash('md5').update(text).digest('hex');
}

function callAmapGeocode(address, callback){
  if (!AMAP_REST_KEY) return callback(new Error('AMAP_REST_KEY not configured'));

  const path = '/v3/geocode/geo';
  const query = `address=${encodeURIComponent(address)}&key=${AMAP_REST_KEY}`;
  let finalPath = path + '?' + query;

  if (AMAP_SK) {
    // For AMap REST signature: md5(path + '?' + query + sk)
    const sig = md5(finalPath + AMAP_SK);
    finalPath += `&sig=${sig}`;
  }

  const options = {
    hostname: 'restapi.amap.com',
    port: 443,
    path: finalPath,
    method: 'GET'
  };

  const req = https.request(options, (res) => {
    let data = '';
    res.on('data', chunk => data += chunk);
    res.on('end', () => callback(null, { statusCode: res.statusCode, body: data }));
  });

  req.on('error', (e) => callback(e));
  req.end();
}

const server = http.createServer((req, res) => {
  // Basic CORS + routing
  res.setHeader('Access-Control-Allow-Origin', '*');
  res.setHeader('Access-Control-Allow-Methods', 'GET,OPTIONS');
  res.setHeader('Access-Control-Allow-Headers', 'Content-Type');

  if (req.method === 'OPTIONS') {
    res.writeHead(204);
    return res.end();
  }

  const parsed = url.parse(req.url, true);
  if (parsed.pathname === '/api/geocode' && parsed.query && parsed.query.address) {
    const address = parsed.query.address;
    callAmapGeocode(address, (err, result) => {
      if (err) {
        res.writeHead(500, { 'Content-Type': 'application/json' });
        return res.end(JSON.stringify({ error: err.message }));
      }
      res.writeHead(result.statusCode || 200, { 'Content-Type': 'application/json' });
      return res.end(result.body);
    });
  } else if (parsed.pathname === '/health') {
    res.writeHead(200, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ ok: true }));
  } else {
    res.writeHead(404, { 'Content-Type': 'application/json' });
    res.end(JSON.stringify({ error: 'not found' }));
  }
});

server.listen(PORT, () => {
  console.log(`AMap proxy server listening on http://localhost:${PORT}`);
});
