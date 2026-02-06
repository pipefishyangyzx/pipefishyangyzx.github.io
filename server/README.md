# AMap proxy (示例)

这是一个轻量的 Node.js HTTP 代理，用于在服务器端调用高德 REST API（地理编码），并可选地添加 `sig` 签名。

快速开始：

1. 在项目根目录创建 `.env`（不要提交）：

```
AMAP_REST_KEY=your_server_key_here
# 可选：如果您的高德应用配置了安全码 (sk)，填入下面一行
AMAP_SK=your_sk_here
# 代理端口（可选）
PORT=3000
```

2. 运行代理：

```bash
# 进入 server 目录
node server/index.js
```

3. 请求示例：

```
GET http://localhost:3000/api/geocode?address=中关村
```

注意：此示例使用内置 `https` 模块，不依赖额外库；生产部署请使用更完善的框架并做好安全控制（限流、鉴权、HTTPS 等）。
