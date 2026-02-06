#!/bin/bash

# 丰图科技网站 - 本地开发服务器启动脚本

echo "🚀 启动丰图科技网站本地服务器..."
echo ""
echo "📍 访问地址: http://localhost:8000"
echo "📍 本地文件位置: $(pwd)"
echo ""
echo "按 Ctrl+C 停止服务器"
echo ""

# 使用Python 3启动HTTP服务器
python3 -m http.server 8000 --bind 127.0.0.1
