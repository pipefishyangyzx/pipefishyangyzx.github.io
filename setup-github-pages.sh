#!/bin/bash

# 📱 GitHub Pages 交互式配置助手

clear
echo "═══════════════════════════════════════════════════════════"
echo "     🚀 GitHub Pages 交互式配置助手"
echo "═══════════════════════════════════════════════════════════"
echo ""
echo "本脚本将帮助您将网站上传到GitHub Pages"
echo ""

# 1. 获取用户名
read -p "请输入您的 GitHub 用户名: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ 用户名不能为空，请重试"
    exit 1
fi

REPO_NAME="${GITHUB_USERNAME}.github.io"

echo ""
echo "═══════════════════════════════════════════════════════════"
echo "📝 配置信息确认"
echo "═══════════════════════════════════════════════════════════"
echo "GitHub 用户名: $GITHUB_USERNAME"
echo "仓库名称: $REPO_NAME"
echo "仓库 URL: https://github.com/$GITHUB_USERNAME/$REPO_NAME"
echo ""
read -p "信息是否正确？(y/n): " confirm

if [ "$confirm" != "y" ]; then
    echo "❌ 已取消操作"
    exit 1
fi

echo ""
echo "═══════════════════════════════════════════════════════════"
echo "⚠️  在继续之前，请确保已完成以下步骤："
echo "═══════════════════════════════════════════════════════════"
echo "1. ✅ 在 GitHub 上创建了名为 '$REPO_NAME' 的公开仓库"
echo "   📍 地址: https://github.com/new"
echo "   📍 选择Public（公开）"
echo "   📍 不要初始化任何文件"
echo ""
echo "2. ✅ 已登录GitHub账户"
echo ""
echo "3. ✅ 已生成 Personal Access Token（如需要）"
echo "   📍 链接: https://github.com/settings/tokens"
echo ""

read -p "已完成上述步骤？(y/n): " ready

if [ "$ready" != "y" ]; then
    echo "❌ 请先完成上述步骤后再运行此脚本"
    exit 1
fi

echo ""
echo "═══════════════════════════════════════════════════════════"
echo "📤 开始上传代码..."
echo "═══════════════════════════════════════════════════════════"
echo ""

cd /Users/yanghailong/Downloads/web

# 2. 检查是否已有远程仓库
if git remote get-url origin &> /dev/null; then
    echo "ℹ️  检测到已存在的远程仓库，移除中..."
    git remote remove origin
fi

# 3. 添加新的远程仓库
echo "🔗 添加远程仓库..."
git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git

# 4. 确保在main分支
echo "🌿 切换到 main 分支..."
git branch -M main

# 5. 推送代码
echo "📤 上传代码到 GitHub...（可能需要输入凭证）"
echo ""
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "═══════════════════════════════════════════════════════════"
    echo "✅ 代码上传成功！"
    echo "═══════════════════════════════════════════════════════════"
    echo ""
    echo "📋 后续步骤（在GitHub网页上完成）："
    echo ""
    echo "1️⃣  访问: https://github.com/$GITHUB_USERNAME/$REPO_NAME/settings/pages"
    echo ""
    echo "2️⃣  在 'Source' 下拉菜单选择:"
    echo "   - Build and deployment → Deploy from a branch"
    echo "   - Branch: main"
    echo "   - Folder: / (root)"
    echo ""
    echo "3️⃣  点击 'Save' 按钮"
    echo ""
    echo "4️⃣  等待 2-5 分钟后，访问："
    echo "   🌐 https://$GITHUB_USERNAME.github.io"
    echo ""
    echo "⏱️  如果页面未立即显示，清空浏览器缓存后重试"
    echo ""
    echo "═══════════════════════════════════════════════════════════"
else
    echo ""
    echo "❌ 上传失败！"
    echo "可能原因："
    echo "  • GitHub用户名或仓库名不正确"
    echo "  • 未使用正确的身份验证方式"
    echo "  • 网络连接问题"
    echo ""
    echo "💡 解决方案："
    echo "  1. 检查GitHub用户名是否正确"
    echo "  2. 确认在GitHub上创建了 $REPO_NAME 仓库"
    echo "  3. 使用 Personal Access Token 而不是密码"
    echo ""
    exit 1
fi
