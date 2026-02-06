#!/bin/bash

# GitHub 推送诊断和修复脚本

echo "╔════════════════════════════════════════════════════════════╗"
echo "║  🔧 GitHub 推送诊断和修复工具                           ║"
echo "╚════════════════════════════════════════════════════════════╝"
echo ""

cd /Users/yanghailong/Downloads/web

# 步骤1：检查仓库
echo "📋 检查清单："
echo ""
echo "✓ 第1项：GitHub上已创建仓库"
echo "   访问: https://github.com/new"
echo "   仓库名: pipefishyangyzx.github.io"
echo "   选择: Public"
echo ""
read -p "已完成？(y/n): " done_repo

if [ "$done_repo" != "y" ]; then
    echo ""
    echo "❌ 请先创建GitHub仓库后再运行此脚本"
    echo "创建链接: https://github.com/new"
    exit 1
fi

# 步骤2：验证本地Git配置
echo ""
echo "✓ 第2项：验证本地Git配置"

# 检查远程URL
CURRENT_URL=$(git config --get remote.origin.url)
EXPECTED_URL="https://github.com/pipefishyangyzx/pipefishyangyzx.github.io.git"

if [ "$CURRENT_URL" == "$EXPECTED_URL" ]; then
    echo "   ✅ 远程URL正确"
else
    echo "   ⚠️  远程URL需要修复"
    echo "   当前: $CURRENT_URL"
    echo "   需要: $EXPECTED_URL"
    git remote set-url origin "$EXPECTED_URL"
    echo "   ✅ 已修复"
fi

# 步骤3：选择认证方式
echo ""
echo "✓ 第3项：选择认证方式"
echo ""
echo "方式A️⃣ : 使用 GitHub CLI（自动处理，推荐）"
echo "方式B️⃣ : 使用 SSH密钥（需要预配置）"
echo "方式C️⃣ : 手动输入 Personal Access Token"
echo ""
read -p "请选择 (A/B/C): " auth_choice

case $auth_choice in
    A|a)
        echo ""
        echo "🔐 使用 GitHub CLI"
        echo ""
        
        # 检查gh是否安装
        if ! command -v gh &> /dev/null; then
            echo "⚠️  检测到未安装GitHub CLI，正在安装..."
            brew install gh
        fi
        
        # 检查是否已登录
        if ! gh auth status &> /dev/null; then
            echo "📝 需要登录GitHub账户"
            gh auth login --web
        fi
        
        echo "📤 使用GitHub CLI推送..."
        git push -u origin main
        ;;
        
    B|b)
        echo ""
        echo "🔑 使用 SSH 密钥"
        echo ""
        
        if [ ! -f ~/.ssh/id_rsa ]; then
            echo "❌ 未找到SSH密钥"
            echo "请运行：ssh-keygen -t rsa -b 4096"
            exit 1
        fi
        
        # 切换到SSH URL
        git remote set-url origin git@github.com:pipefishyangyzx/pipefishyangyzx.github.io.git
        
        echo "📤 使用SSH推送..."
        git push -u origin main
        ;;
        
    C|c)
        echo ""
        echo "🔐 使用 Personal Access Token"
        echo ""
        echo "📝 获取Token步骤："
        echo "1. 访问: https://github.com/settings/tokens/new"
        echo "2. 选择: Tokens (classic)"
        echo "3. 权限: 勾选 'repo' 和 'workflow'"
        echo "4. 生成并复制Token"
        echo ""
        read -sp "粘贴Token: " TOKEN
        echo ""
        
        if [ -z "$TOKEN" ]; then
            echo "❌ Token为空"
            exit 1
        fi
        
        echo "📤 推送中..."
        git push "https://pipefishyangyzx:${TOKEN}@github.com/pipefishyangyzx/pipefishyangyzx.github.io.git" main
        unset TOKEN
        ;;
        
    *)
        echo "❌ 无效选择"
        exit 1
        ;;
esac

# 检查推送结果
if [ $? -eq 0 ]; then
    echo ""
    echo "╔════════════════════════════════════════════════════════════╗"
    echo "║  ✅ 推送成功！                                            ║"
    echo "╚════════════════════════════════════════════════════════════╝"
    echo ""
    echo "📋 后续步骤（在GitHub网页上完成）："
    echo ""
    echo "1️⃣  访问: https://github.com/pipefishyangyzx/pipefishyangyzx.github.io/settings/pages"
    echo ""
    echo "2️⃣  配置 Build and deployment:"
    echo "    • Source: Deploy from a branch"
    echo "    • Branch: main"
    echo "    • Folder: / (root)"
    echo "    • 点击 Save"
    echo ""
    echo "3️⃣  等待 2-5 分钟，然后访问（可能需要清空浏览器缓存）："
    echo "    🌐 https://pipefishyangyzx.github.io"
    echo ""
else
    echo ""
    echo "❌ 推送失败"
    echo ""
    echo "可能的原因："
    echo "• GitHub仓库不存在"
    echo "• 认证信息错误"
    echo "• 网络连接问题"
    echo ""
    echo "解决方案："
    echo "1. 确保已在 https://github.com/new 创建仓库"
    echo "2. 仓库名必须是: pipefishyangyzx.github.io"
    echo "3. 必须选择 Public（公开）"
    echo ""
fi
