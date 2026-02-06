#!/bin/bash

# GitHub Personal Access Token 认证配置

echo "🔐 GitHub Pages 推送配置"
echo "================================"
echo ""
echo "为了将代码推送到GitHub，我们需要配置认证。"
echo ""
echo "请按照以下步骤操作："
echo ""
echo "1️⃣  访问: https://github.com/settings/tokens/new"
echo ""
echo "2️⃣  创建新Token("
echo "   ✓ 勾选 'repo' 权限"
echo "   ✓ 勾选 'workflow' 权限"
echo "   ✓ 生成Token后复制（只显示一次！）"
echo ""
echo "3️⃣  将Token输入到下面的提示中"
echo ""

read -sp "请粘贴您的Personal Access Token: " TOKEN

if [ -z "$TOKEN" ]; then
    echo ""
    echo "❌ Token不能为空"
    exit 1
fi

echo ""
echo ""
echo "🔧 配置git凭证..."

# 配置git使用token
cd /Users/yanghailong/Downloads/web

# 创建临时凭证管理器配置
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

# 使用Token推送
echo "📤 开始推送代码..."

# 构造URL
REPO_URL="https://pipefishyangyzx:${TOKEN}@github.com/pipefishyangyzx/pipefishyangyzx.github.io.git"

# 推送代码
git push "$REPO_URL" main --force

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 推送成功！"
    echo ""
    echo "后续步骤："
    echo "1. 访问: https://github.com/pipefishyangyzx/pipefishyangyzx.github.io/settings/pages"
    echo "2. 在 'Source' 选择 'Deploy from a branch'"
    echo "3. 选择 'main' 分支和根目录"
    echo "4. 点击 Save"
    echo ""
    echo "5-10分钟后访问: https://pipefishyangyzx.github.io"
else
    echo ""
    echo "❌ 推送失败"
    echo "可能原因："
    echo "  • Token无效或已过期"
    echo "  • 网络连接问题"
    echo "  • 仓库尚未创建"
fi

# 清除敏感信息
unset TOKEN
