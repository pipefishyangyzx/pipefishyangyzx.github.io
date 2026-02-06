# 丰图科技官方门户网站

这是一个现代化的企业门户网站项目，为丰图科技展示公司信息、产品服务和企业动态。

## 📋 项目概述

丰图科技门户网站是一个完整的企业级网站解决方案，展示了公司的产品、服务、企业文化和联系方式。网站设计现代化，响应式布局，支持各种设备访问。

## ✨ 主要特性

- **响应式设计** - 完美适配桌面、平板和手机设备
- **现代化UI** - 采用最新的设计趋势和用户体验最佳实践
- **流畅交互** - 平滑的页面滚动和动画效果
- **SEO友好** - 优化的HTML结构和元数据
- **快速加载** - 轻量级资源，优化的性能
- **易于维护** - 清晰的代码结构和注释

## 📁 项目结构

```
web/
├── index.html              # 首页
├── products.html           # 产品中心
├── about.html              # 关于我们
├── news.html               # 新闻中心
├── contact.html            # 联系我们
├── assets/
│   ├── css/
│   │   └── style.css       # 主样式表
│   ├── js/
│   │   └── main.js         # 主JavaScript文件
│   └── images/             # 图片资源目录（预留）
├── .github/
│   └── copilot-instructions.md  # 项目指导
└── README.md               # 项目文档
```

## 🌐 页面说明

### 1. 首页 (index.html)
企业形象展示页面，包含：
- 英雄区域（主标题和CTA按钮）
- 特性展示（4个核心优势）
- 产品预览（主要产品展示）
- 公司统计数据
- 客户评价
- 行动号召区域

### 2. 产品中心 (products.html)
详细展示公司的核心产品：
- 数据分析平台 (DataViz Pro)
- 云解决方案 (CloudBase Enterprise)
- 智能系统 (AI Assistant Suite)
- 企业管理平台 (ERP Suite)

### 3. 关于我们 (about.html)
企业介绍和文化展示：
- 公司简介
- 使命和愿景
- 核心价值观
- 发展历程（时间轴）
- 领导团队介绍

### 4. 新闻中心 (news.html)
公司新闻和动态：
- 最新新闻列表
- 新闻分类标签
- 新闻详情链接

### 5. 联系我们 (contact.html)
客户联系和沟通页面：
- 联系信息表单
- 办公地址和电话
- 邮箱和工作时间
- 分支办公室列表

## 🎨 设计说明

### 色彩方案
- 主色（Primary）：#2c3e50（深蓝灰）
- 强调色（Accent）：#3498db（天蓝色）
- 背景色（Light）：#ecf0f1（浅灰）
- 文本色（Text）：#333（深灰）

### 字体
- 使用系统字体栈：'Segoe UI', Tahoma, Geneva, Verdana, sans-serif
- 确保跨越浏览器兼容性

### 响应式断点
- 桌面版：> 768px
- 平板版：768px
- 手机版：< 480px

## 💻 使用方法

### 方法一：直接在浏览器中打开
```bash
# 用浏览器打开任意HTML文件
# Windows: 双击 index.html
# Mac: 双击 index.html 或 右键选择 "用...打开" > "Safari/Chrome"
```

### 方法二：使用本地服务器（推荐）

#### 使用Python（Python 3）
```bash
cd /Users/yanghailong/Downloads/web
python -m http.server 8000
# 然后在浏览器中打开 http://localhost:8000
```

#### 使用Node.js
```bash
# 全局安装 http-server
npm install -g http-server

# 启动服务器
cd /Users/yanghailong/Downloads/web
http-server -p 8000
# 然后在浏览器中打开 http://localhost:8000
```

#### 使用VS Code Live Server扩展
1. 在VS Code中安装 "Live Server" 扩展
2. 右键点击 index.html
3. 选择 "Open with Live Server"

## 🔧 功能说明

### JavaScript功能
- **汉堡菜单**：移动设备的响应式导航菜单
- **导航高亮**：根据当前页面自动高亮导航项
- **表单验证**：联系表单的客户端验证
- **平滑滚动**：页面内导航的平滑滚动效果
- **计数器动画**：统计数据的动画展示
- **回到顶部按钮**：便于用户快速返回顶部
- **Intersection Observer**：元素进入视口时的动画触发

## 🖥️ 浏览器兼容性

- Chrome（最新版）
- Firefox（最新版）
- Safari（最新版）
- Edge（最新版）
- 移动浏览器（iOS Safari, Chrome Mobile）

## 📝 修改和定制

### 更改公司信息
编辑各HTML文件中的：
- 公司名称
- 联系信息
- 产品描述
- 新闻内容

### 自定义样式
编辑 `assets/css/style.css`：
- 修改CSS变量（--primary-color 等）来改变色彩方案
- 调整媒体查询断点以适应不同设备
- 增加或修改样式规则

### 扩展功能
编辑 `assets/js/main.js`：
- 添加新的事件监听器
- 实现更复杂的交互逻辑
- 集成与后端API的通信

## 🚀 性能优化建议

1. **压缩资源**
   - 使用在线工具压缩CSS和JavaScript
   - 优化图片大小和格式

2. **缓存策略**
   - 配置服务器缓存头
   - 使用CDN加速资源加载

3. **延迟加载**
   - 为图片添加 `loading="lazy"` 属性
   - 动态加载JavaScript

4. **代码分割**
   - 将JavaScript代码分割成多个模块
   - 按需加载功能模块

## 📱 SEO优化

- 使用语义化HTML标签
- 添加适当的meta描述
- 使用结构化数据标记
- 优化页面加载速度
- 提交到搜索引擎

## 🔐 安全建议

1. 表单数据验证（已实现客户端验证）
2. 在生产环境中使用HTTPS
3. 定期更新依赖
4. 实现CSRF保护和速率限制

## 📞 联系和支持

- 邮箱：info@fengtuvision.com
- 电话：400-800-8888
- 地址：深圳市南山区科技园路XXX号

## 📄 许可证

Copyright © 2024 丰图科技有限公司. 保留所有权利。

## 🎯 后续改进计划

- [ ] 添加多语言支持
- [ ] 集成在线客服系统
- [ ] 添加博客功能
- [ ] 实现用户登录系统
- [ ] 添加在线演示预约功能
- [ ] 集成CRM系统
- [ ] 添加数据分析功能

## 👨‍💻 开发者

- 前端设计和开发
- 响应式布局实现
- 交互功能开发
- 性能优化

---

**最后更新**：2024年2月6日

感谢您使用丰图科技官方网站！
