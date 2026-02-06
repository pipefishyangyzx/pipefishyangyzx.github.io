# 快速部署检查清单

本文档帮您快速完成部署。约需 10-15 分钟。

## 前置验证（5 分钟）

- [ ] 验证本地代理可用
  ```bash
  AMAP_REST_KEY=9be0a8d04b00ca50540af826d0130c0b npm start
  # 另开终端测试：
  curl "http://localhost:3000/api/geocode?address=%E4%B8%AD%E5%85%B3%E6%9D%91"
  # 应返回 status":"1" 和地址列表
  ```

- [ ] 确认代码已推到 GitHub
  ```bash
  git log -1 --oneline
  # 应显示最近的 commit
  ```

## 选择部署平台（选一个）

### 方案 1：Render（推荐，已配置好）

1. 登录 [render.com](https://render.com)（用 GitHub 账号）

2. 点击 **"New +"** → **"Web Service"**

3. 连接仓库
   - 选 `pipefishyangyzx.github.io`
   - 分支：`main`

4. 配置
   - Name: `fengtuvision-api`
   - Environment: `Node`
   - Build Command: `npm install`
   - Start Command: `npm start`
   - 点「Create Web Service」

5. 添加环境变量
   - 在 Service 页找 **"Environment"**
   - 点「Add Environment Variable」
   - Key: `AMAP_REST_KEY`
   - Value: `9be0a8d04b00ca50540af826d0130c0b`
   - 保存（会自动重启部署）

6. 等待部署完成
   - 查看 Render 页面的 Deploy 日志
   - 看到 "Service live" 表示成功
   - 复制 URL（例 `https://fengtuvision-api.onrender.com`）

7. **更新前端配置**（重要）
   - 编辑本地 `index.html`
   - 找到行：`<meta name="amap-proxy-url" content="">`
   - 改为：`<meta name="amap-proxy-url" content="https://fengtuvision-api.onrender.com">`
   - 提交并推送：
     ```bash
     git add index.html
     git commit -m "chore: set proxy URL to Render deployment"
     git push origin main
     ```
   - GitHub Pages 会自动更新（1-5 分钟）

8. 测试
   - 访问 https://pipefishyangyzx.github.io
   - 在首页搜索框输入"中关村"
   - 应看到地图生成标记和搜索结果提示

### 方案 2：Glitch（更快，在线编辑）

1. 访问 [glitch.com/create](https://glitch.com/create)

2. 选 **"Import from GitHub"**
   - 输入：`https://github.com/pipefishyangyzx/pipefishyangyzx.github.io`
   - 点「Import」

3. 等待 Glitch 导入（约 30 秒）

4. 编辑 `.env`
   - 点右上角「.env」
   - 添加：`AMAP_REST_KEY=9be0a8d04b00ca50540af826d0130c0b`
   - 自动保存

5. Glitch 自动部署
   - 左上角显示 Project 名字，后面跟一个 URL
   - 记下 URL（例 `https://your-project-name.glitch.me`）

6. **更新前端配置**
   - 在本地编辑 `index.html`
   - 改 meta 的 proxy-url：`<meta name="amap-proxy-url" content="https://your-project-name.glitch.me">`
   - 提交推送

7. 测试搜索功能

### 方案 3：Railway（备选）

1. 访问 [railway.app](https://railway.app)
2. 登录（GitHub）
3. 点「New Project」→「Deploy from GitHub」
4. 选本仓库
5. 添加 **Environment** 变量：`AMAP_REST_KEY=9be0a8d04b00ca50540af826d0130c0b`
6. 部署成功后复制 URL
7. 更新前端 proxy-url meta
8. 测试

## 最后验证（2 分钟）

- [ ] 访问 https://pipefishyangyzx.github.io
- [ ] 打开浏览器 DevTools → Network
- [ ] 在首页搜索框输入任何地址（如"北京"）
- [ ] 确认：
  - Network 中能看到对代理的请求（如 `fengtuvision-api.onrender.com/api/geocode`）
  - 返回 status 200 且 body 包含 geocodes
  - 地图上显示标记

## 常见问题

| 问题 | 解决 |
|------|------|
| 部署后 Render 显示"No module found" | 应该已配置 `npm install`；检查 Build Log 看错误详情 |
| 查询返回 USERKEY_PLAT_NOMATCH | Key 配置错误；检查 Render/Glitch 的 `AMAP_REST_KEY` 环境变量 |
| 前端搜索没反应 | 检查 `index.html` 的 proxy-url 是否正确；查看 Console 是否有错误 |
| 一切配置好但搜索还是失败 | 等待 5 分钟（DNS/缓存），或清除浏览器缓存（Ctrl+Shift+Del） |

## 完成标记

- [ ] 部署完成
- [ ] 代理可访问
- [ ] 前端配置已更新
- [ ] 搜索功能工作正常

---

有问题？查看仓库的 [DEPLOY.md](./DEPLOY.md) 获取详细技术说明。
