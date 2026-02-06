# 部署指南

本项目包含静态前端网站 + Node.js 代理服务器。

## 架构说明

- **前端（静态）**：纯 HTML/CSS/JS，支持静态托管（GitHub Pages、Netlify、Cloudflare Pages 等）
- **代理（Node.js）**：`server/index.js`，负责调用高德 REST API：
  - 接收前端请求 `GET /api/geocode?address=关键词`
  - 转发到高德服务器（使用服务端 Key）
  - 返回结果给前端（支持 CORS）

## 推荐部署方案

### 方案 1：Render（推荐）

完整应用+前端一起托管，免费层可用。

1. **注册并连接 GitHub**
   - 访问 [render.com](https://render.com)
   - 用 GitHub 账号登录
   - 授权访问您的仓库

2. **创建新的 Web Service**
   - 点击 "New +" → "Web Service"
   - 选您的仓库 `pipefishyangyzx.github.io`
   - Name：`fengtuvision-api`（或任意名字）
   - Environment：`Node`
   - Build Command：`npm install`
   - Start Command：`npm start`

3. **设置环境变量**
   - 在 Service 配置页面找到 "Environment"
   - 添加新的环境变量：
     ```
     AMAP_REST_KEY=9be0a8d04b00ca50540af826d0130c0b
     ```
   - （可选）若有安全码，添加：`AMAP_SK=your_sk_here`

4. **部署并获取 URL**
   - Render 会自动部署，获得类似 `https://fengtuvision-api.onrender.com` 的公开 URL
   - 可能会闲置时"睡眠"（可升级为付费避免）

5. **更新前端配置**
   - 编辑 `assets/js/main.js` 的 geocodeQuery 函数
   - 将相对路径 `/api/geocode` 改为绝对 URL：
     ```javascript
     const baseUrl = 'https://fengtuvision-api.onrender.com';
     const proxyResp = await fetch(baseUrl + '/api/geocode?address=' + encodeURIComponent(query), { signal: controller.signal });
     ```
   - 或在 `index.html` 中添加 meta 标签并在 JS 中读取

### 方案 2：Glitch（更快速）

在线编辑 + 即时部署，零配置。

1. **Remix 本项目**
   - 访问 glitch.com
   - 创建 New Project → Import from GitHub
   - 输入 `https://github.com/pipefishyangyzx/pipefishyangyzx.github.io`

2. **设置环境变量**
   - 在 Glitch 编辑器右上角点击 ".env"
   - 添加：`AMAP_REST_KEY=9be0a8d04b00ca50540af826d0130c0b`

3. **自动部署**
   - Glitch 会自动运行 `npm start`
   - 获得 URL（例如 `https://your-project-name.glitch.me`）

### 方案 3：Railway（另一选择）

1. 登录 [railway.app](https://railway.app)
2. 点击 "New Project" → "Deploy from GitHub"
3. 选择本仓库
4. 添加环境变量 `AMAP_REST_KEY`
5. 部署

## 本地测试

1. 创建 `.env` 文件：
   ```
   AMAP_REST_KEY=9be0a8d04b00ca50540af826d0130c0b
   PORT=3000
   ```

2. 启动代理：
   ```bash
   npm start
   # 或
   node server/index.js
   ```

3. 访问本地静态站点（在另一个终端）：
   ```bash
   cd /Users/yanghailong/Downloads/web
   python3 -m http.server 8000
   # 访问 http://localhost:8000
   ```

4. 打开浏览器，在首页搜索框输入地址（如"中关村"）
   - 代理会通过 `http://localhost:3000/api/geocode` 返回结果

## 生产配置建议

- **HTTPS**：所有部署平台都提供免费 HTTPS，确保线上使用 HTTPS 以符合浏览器 CORS 策略
- **安全码（SK）**：若高德 Key 配置了 SK，设置 `AMAP_SK` 环境变量，代理会自动计算签名
- **Referer / IP 白名单**：根据高德控制台配置：
  - 若为 JS Key，配置 Referer 白名单（例如 `https://pipefishyangyzx.github.io`）
  - 若为 REST Key，配置代理服务器的 IP 白名单
- **缓存**：可在代理添加简单缓存以减少高德 API 调用；GitHub 的代码可以参考 `server/index.js`

## 故障排查

| 症状 | 原因 | 解决 |
|------|------|------|
| HTTP 400 Bad Request | 查询参数未正确 URL 编码 | 前端确保 `encodeURIComponent(query)` |
| USERKEY_PLAT_NOMATCH | Key 类型错误或白名单不匹配 | 检查高德控制台 Key 配置 |
| CORS 错误 | 跨域请求被拦截 | 代理已设置 `Access-Control-Allow-Origin: *` |
| 代理超时 | 网络问题或高德服务延迟 | 前端已设置 3 秒超时并回退 |

## 更新频率

- 前端改动（HTML/CSS/JS）：GitHub Pages 自动部署（1-5 分钟）
- 代理改动（Node.js）：需要重新部署（按平台要求手动或自动进行）
