#!/bin/bash

# 简单推送脚本 - 用Personal Access Token推送到GitHub

echo "🚀 推送代码到GitHub Pages"
echo "=================================="
echo ""

cd /Users/yanghailong/Downloads/web

# 获取Token
echo "📝 您需要一个GitHub Personal Access Token来推送代码"
echo ""
echo "获取Token的步骤："
echo "1. 访问: https://github.com/settings/tokens/new"
echo "2. 选择: Tokens (classic)"
echo "3. 勾选权限: repo 和 workflow"
echo "4. 点击: Generate token"
echo "5. 复制生成的Token（只显示一次！）"
echo ""
read -sp "请粘贴您的GitHub Personal Access Token: " TOKEN

if [ -z "$TOKEN" ]; then
    echo ""
    echo "❌ Token不能为空"
    exit 1
fi

echo ""
echo ""
echo "📤 正在推送代码到GitHub..."
echo ""

# 推送代码
git push "https://pipefishyangyzx:${TOKEN}@github.com/pipefishyangyzx/pipefishyangyzx.github.io.git" main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 推送成功！"
    echo ""
    echo "📋 接下来的步骤："
    echo ""
    echo "1️⃣  访问 GitHub Pages 设置页面："
    echo "    https://github.com/pipefishyangyzx/pipefishyangyzx.github.io/settings/pages"
    echo ""
    echo "2️⃣  配置 Source:"
    echo "    • 选择 'Deploy from a branch'"
    echo "    • Branch: main"
    echo "    • 文件夹: / (root)"
    echo "    • 点击 Save"
    echo ""
    echo "3️⃣  等待 2-5 分钟，然后访问（刷新页面）："
    echo "    https://pipefishyangyzx.github.io"
    echo ""
else
    echo ""
    echo "❌ 推送失败"
    echo ""
    echo "可能的原因："
    echo "• Token无效或已过期"
    echo "• GitHub用户名/仓库名不正确"
    echo "• 网络连接问题"
    echo ""
fi

# 安全地清除Token
unset TOKEN
