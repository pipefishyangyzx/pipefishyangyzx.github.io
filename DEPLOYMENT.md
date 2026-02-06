# 🚀 丰图科技网站部署指南

## 快速开始：三种部署方案

---

## 方案1️⃣ GitHub Pages（最推荐 - 免费）

### 步骤1：上传代码到GitHub

```bash
# 1. 在GitHub创建一个名为 fengtuvision.github.io 的公开仓库
#    (https://github.com/new)

# 2. 添加远程仓库
git remote add origin https://github.com/你的用户名/fengtuvision.github.io.git

# 3. 推送到GitHub
git branch -M main
git push -u origin main
```

### 步骤2：启用GitHub Pages

1. 进入仓库的 **Settings** 标签
2. 找到 **Pages** 选项
3. 选择 **Deploy from a branch**
4. 选择 **main** 分支，根目录 **/root**
5. 点击 **Save**

### 步骤3：访问网站

等待2-5分钟，访问：**https://你的用户名.github.io**

**示例：** https://fengtuvision.github.io

---

## 方案2️⃣ Netlify（支持自定义域名）

### 步骤1：连接GitHub仓库

1. 访问 [Netlify.com](https://www.netlify.com)
2. 点击 **Sign up** → 选择用GitHub登录
3. 点击 **New site from Git**
4. 选择 **GitHub**，授权并选择你的仓库
5. 构建设置无需修改（保持默认）
6. 点击 **Deploy site**

### 步骤2：自定义域名（付费）

1. 在Netlify项目的 **Domain settings**
2. 点击 **Add domain**
3. 购买域名或连接已有域名
4. 按照提示配置DNS

**费用：** ¥50-150/年（域名）+ $15/月（续费）

---

## 方案3️⃣ 国内云服务（适合中国用户）

### 推荐服务商

#### 📌 阿里云
- 访问：[阿里云OSS](https://oss.aliyun.com/)
- **年成本：** CNY 50-200

**快速步骤：**
```bash
# 1. 创建OSS Bucket（存储桶）
# 2. 上传网站文件
# 3. 配置静态网站托管
# 4. 绑定自定义域名
# 5. 完成ICP备案（7-15天）
```

#### 📌 腾讯云
- 访问：[腾讯云COS](https://cloud.tencent.com/product/cos)
- **年成本：** CNY 50-200

#### 📌 七牛云
- 访问：[七牛云](https://www.qiniu.com/)
- **年成本：** CNY 50-100

---

## 🌐 域名注册推荐

| 服务商 | 特点 | 链接 |
|--------|------|------|
| **Namecheap** | 便宜，国际 | https://www.namecheap.com |
| **阿里云域名** | 国内快速 | https://wanwang.aliyun.com |
| **腾讯云域名** | 支持备案 | https://cloud.tencent.com/product/dm |
| **GoDaddy** | 知名度高 | https://www.godaddy.com |

---

## 📊 部署方案对比表

```
┌─────────────────┬──────────────┬──────────────┬────────────────┐
│ 方案            │ 启用域名     │ 成本         │ 启动时间       │
├─────────────────┼──────────────┼──────────────┼────────────────┤
│ GitHub Pages    │ ❌ 无        │ 💰 免费      │ ⚡ 5分钟      │
│ Netlify         │ ✅ 可选      │ 💰 $15/月   │ ⚡ 10分钟     │
│ 国内云服务      │ ✅ 可配置    │ 💘 ¥50/月   │ 🐢 7-15天(备案) │
└─────────────────┴──────────────┴──────────────┴────────────────┘
```

---

## ✅ 部署前检查清单

- [x] 所有HTML文件完整
- [x] CSS样式已加载
- [x] JavaScript功能正常
- [x] 图片路径正确
- [x] 响应式设计可用
- [x] Git仓库已初始化

---

## 🔧 本地测试网站

```bash
# 使用Python简单服务器（推荐）
cd /Users/yanghailong/Downloads/web
python3 -m http.server 8000

# 然后在浏览器访问：http://localhost:8000
```

---

## 📝 部署后维护

### 更新网站内容

```bash
# 修改文件后提交更新
git add .
git commit -m "更新网站内容"
git push origin main

# GitHub Pages 和 Netlify 会自动部署
```

### 监测网站性能

- **Google Analytics：** 添加流量分析
- **Cloudflare：** 加速 + CDN
- **Uptimerobot：** 监测在线状态

---

## 🎯 我的建议

**新手：** 使用 **GitHub Pages**（完全免费）

**需要自定义域名：** 使用 **Netlify**（简单快速）

**国内用户：** 使用 **阿里云/腾讯云**（访问快，但需备案）

---

## 💬 需要帮助？

如需协助具体部署步骤，请告诉我您选择的方案 👈
