# 🚀 GitHub Pages 完整配置指南

## ⚙️ 前置要求
- ✅ GitHub账户（https://github.com/signup）
- ✅ Git已安装
- ✅ 网站代码已准备好

---

## 📋 配置步骤（5分钟）

### 步骤1️⃣：在GitHub创建仓库

1. **登录GitHub**：https://github.com/login
2. **新建仓库**：点击右上角 `+` → `New repository`
3. **仓库名称很重要**：输入 `你的用户名.github.io`
   - 示例：如果你的用户名是 `john-doe`，则输入 `john-doe.github.io`
4. **选项配置**：
   - 选择 **Public**（公开）
   - **不要** 勾选 "Initialize with README"
   - 点击 **Create repository**

✅ 仓库创建完成！

---

### 步骤2️⃣：上传代码到GitHub

在您的Mac终端中运行以下命令：

```bash
# 进入网站目录
cd /Users/yanghailong/Downloads/web

# 添加远程仓库地址（将 your-username 替换为你的GitHub用户名）
git remote add origin https://github.com/your-username/your-username.github.io.git

# 设置主分支为 main
git branch -M main

# 上传代码到GitHub
git push -u origin main

# 首次上传可能需要输入GitHub用户名和密码（或Personal Access Token）
```

**遇到身份验证问题？** 

GitHub已不支持密码验证，需要使用个人访问令牌（PAT）：
1. 访问：https://github.com/settings/tokens
2. 点击 **Generate new token** → **Generate new token (classic)**
3. 勾选 `repo` 和 `workflow` 权限
4. 复制生成的令牌
5. 上传时用令牌代替密码

---

### 步骤3️⃣：启用GitHub Pages

1. **进入仓库设置**：
   - 访问 `https://github.com/你的用户名/你的用户名.github.io`
   - 点击 **Settings** 标签

2. **找到Pages配置**：
   - 左边菜单 → **Pages**

3. **配置发布源**：
   - **Build and deployment** → **Source**
   - 选择 **Deploy from a branch**
   - **Branch** 选择 `main`
   - **Folder** 选择 `/ (root)`
   - 点击 **Save**

4. **等待部署**：
   - GitHub会自动构建和发布
   - 等待2-5分钟
   - 刷新页面，会看到绿色提示：
     ```
     ✅ Your site is published at https://your-username.github.io
     ```

---

## ✅ 访问您的网站

部署完成后，访问：

```
https://你的用户名.github.io
```

**示例演示链接**：
```
假设用户名为 "fengtuvision"
→ https://fengtuvision.github.io
```

---

## 🔄 日后更新网站

每次修改文件后，按以下步骤更新：

```bash
cd /Users/yanghailong/Downloads/web

# 添加所有更改
git add .

# 提交并输入描述
git commit -m "更新描述，如：Update homepage content"

# 上传到GitHub
git push origin main
```

GitHub Pages会**自动重新部署**，约30秒内生效。

---

## 🌐 配置自定义域名（可选）

### 使用已购买的域名

1. **在GitHub配置**：
   - Settings → Pages → Custom domain
   - 输入你的域名：`example.com`
   - 点击 **Save**

2. **配置DNS记录**：
   在你的域名提供商（GoDaddy、阿里云等）的DNS设置中，添加以下A记录：

   ```
   主机记录: @
   记录类型: A
   记录值: 185.199.108.153
            185.199.109.153
            185.199.110.153
            185.199.111.153
   ```

   或使用CNAME记录：
   ```
   主机记录: www
   记录类型: CNAME
   记录值: 你的用户名.github.io
   ```

3. **配置SSL**：
   - GitHub会自动申请免费SSL证书
   - 等待1-5分钟
   - 勾选 "Enforce HTTPS"

---

## 🐛 故障排除

| 问题 | 解决方案 |
|------|--------|
| **Authentication failed** | 使用GitHub个人访问令牌(PAT)代替密码 |
| **Repository not found** | 检查仓库名是否正确：`username.github.io` |
| **Files not showing** | 检查是否在main分支的根目录，等待5分钟重新部署 |
| **样式/图片不显示** | 清浏览器缓存（Ctrl+Shift+Delete）或使用无痕模式 |
| **Deploy时出错** | 检查Actions选项卡，查看部署日志 |

---

## 📊 检查部署状态

1. 进入仓库
2. 点击 **Actions** 标签
3. 查看最新的部署流程
4. 如果显示 ✅ 则成功
5. 如果显示 ❌ 点击查看错误日志

---

## 🎉 配置完成！

您的网站现在可以通过以下方式访问：
- ✅ GitHub Pages 自动域名：`https://你的用户名.github.io`
- ✅ 自定义域名：（如果已配置）

---

## 📞 需要帮助？

如果遇到任何问题，请告诉我：
1. 您的GitHub用户名
2. 具体的错误信息
3. 我会帮您调试！
