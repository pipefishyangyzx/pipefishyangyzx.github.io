#!/bin/bash

# 快速推送到GitHub脚本 - 适配pipefishyangyzx

set -e

echo "╔═══════════════════════════════════════════════════════════╗"
echo "║  🚀 丰图科技网站 - 推送到GitHub Pages                  ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""

cd /Users/yanghailong/Downloads/web

# 检查仓库信息
echo "📍 仓库信息："
echo "   用户名: pipefishyangyzx"
echo "   仓库: pipefishyangyzx.github.io"
echo "   分支: main"
echo ""

# 检查远程配置
if ! git remote get-url origin &> /dev/null; then
    echo "⚠️  未配置远程仓库，正在配置..."
    git remote add origin https://github.com/pipefishyangyzx/pipefishyangyzx.github.io.git
fi

# 检查main分支
if ! git rev-parse --verify main &> /dev/null; then
    echo "🌿 创建main分支..."
    git branch -M main
fi

echo ""
echo "🔐 GitHub认证方案选择："
echo ""
echo "选项1️⃣ : 使用 Personal Access Token（推荐）"
echo "选项2️⃣ : 使用 SSH密钥（需要预先配置）"
echo "选项3️⃣ : 手动跳过推送"
echo ""
read -p "请选择 (1/2/3): " choice

case $choice in
    1)
        echo ""
        echo "📝 Personal Access Token 方式"
        echo ""
        echo "1. 访问: https://github.com/settings/tokens/new"
        echo "2. 创建新Token:"
        echo "   • 选择 'Tokens (classic)'"
        echo "   • 勾选 'repo' 权限"
        echo "   • 勾选 'workflow' 权限"
        echo "   • 点击 'Generate token'"
        echo "3. 复制生成的Token（只显示一次！）"
        echo ""
        read -sp "粘贴您的Token后按Enter: " token
        echo ""
        
        if [ -z "$token" ]; then
            echo "❌ Token为空，操作取消"
            exit 1
        fi
        
        echo "📤 推送代码..."
        GIT_ASKPASS=false git push https://pipefishyangyzx:"${token}"@github.com/pipefishyangyzx/pipefishyangyzx.github.io.git main --force
        
        # 清除敏感信息
        unset token
        
        echo ""
        echo "✅ 代码推送成功！"
        ;;
        
    2)
        echo ""
        echo "🔑 SSH 密钥方式"
        echo ""
        echo "检查SSH密钥..."
        if [ ! -f ~/.ssh/id_rsa ]; then
            echo "❌ 未找到SSH密钥"
            echo "请先运行: ssh-keygen -t rsa -b 4096 -f ~/.ssh/id_rsa"
            exit 1
        fi
        
        echo "✓ SSH密钥已找到"
        echo ""
        echo "配置远程URL为SSH格式..."
        git remote set-url origin git@github.com:pipefishyangyzx/pipefishyangyzx.github.io.git
        
        echo "📤 推送代码..."
        git push -u origin main --force
        
        echo ""
        echo "✅ 代码推送成功！"
        ;;
        
    3)
        echo "⏭️  跳过推送"
        exit 0
        ;;
        
    *)
        echo "❌ 无效选择"
        exit 1
        ;;
esac

echo ""
echo "╔═══════════════════════════════════════════════════════════╗"
echo "║  后续步骤（在GitHub网页上完成）                        ║"
echo "╚═══════════════════════════════════════════════════════════╝"
echo ""
echo "1️⃣  访问: https://github.com/pipefishyangyzx/pipefishyangyzx.github.io/settings/pages"
echo ""
echo "2️⃣  在 'Source' 下拉菜单选择:"
echo "    • Build and deployment → Deploy from a branch"
echo "    • Branch: main"
echo "    • Folder: / (root)"
echo ""
echo "3️⃣  点击 'Save' 按钮"
echo ""
echo "4️⃣  等待 2-5 分钟后，访问您的网站："
echo "    🌐 https://pipefishyangyzx.github.io"
echo ""
echo "⏱️  如果未立即显示，请清除浏览器缓存后重试"
echo ""
echo "═══════════════════════════════════════════════════════════"
