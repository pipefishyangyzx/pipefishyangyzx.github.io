# 📱 快速部署参考卡

## 🎯 三步快速部署到GitHub Pages

### 第1步：创建GitHub仓库
访问 https://github.com/new，创建名为 `fengtuvision.github.io` 的公开仓库

### 第2步：上传代码
```bash
cd /Users/yanghailong/Downloads/web
git remote add origin https://github.com/你的用户名/fengtuvision.github.io.git
git branch -M main
git push -u origin main
```

### 第3步：启用GitHub Pages
1. 仓库 → Settings → Pages
2. 选择 main 分支
3. 等待2-5分钟自动部署

✅ 完成！访问：https://你的用户名.github.io

---

## 🔄 日后更新网站

```bash
# 修改文件后
git add .
git commit -m "描述你的更改"
git push
```

---

## 🌐 购买自己的域名后

### GitHub Pages + 自定义域名
1. 购买域名（Namecheap / GoDaddy / 阿里云）
2. 在仓库 Settings → Pages → Custom domain 设置
3. 更新DNS记录指向GitHub

### 或使用Netlify（更简单）
1. 连接GitHub仓库到Netlify
2. Netlify自动部署
3. 购买域名后一键添加

---

## 📞 遇到问题？

| 问题 | 解决方案 |
|------|--------|
| 部署不成功 | 检查仓库名是否为 `fengtuvision.github.io` |
| 图片未显示 | 检查 assets 文件夹是否上传 |
| 样式错乱 | 清浏览器缓存（Ctrl+Shift+Del） |
| 需要自定义域名 | 使用Netlify或Vercel |

---

## 📚 本地测试

```bash
# 方式1：运行启动脚本
cd /Users/yanghailong/Downloads/web
./start-server.sh

# 方式2：手动启动
python3 -m http.server 8000

# 访问 http://localhost:8000
```

---

## 🎓 完整文档

详见项目中的 `DEPLOYMENT.md` 文件
