#!/bin/bash

# ImageDefectHub 自动化部署脚本

echo "🚀 开始部署 ImageDefectHub..."

# 1. 检查 Node.js 环境
if ! command -v node &> /dev/null; then
    echo "❌ Node.js 未安装，请先安装 Node.js"
    exit 1
fi

# 2. 安装依赖
echo "📦 安装依赖..."
npm install

# 3. 构建项目
echo "🔨 构建项目..."
npm run build

# 4. 检查构建结果
if [ ! -d "dist" ]; then
    echo "❌ 构建失败，dist 文件夹不存在"
    exit 1
fi

echo "✅ 构建成功！"

# 5. 选择部署方式
echo "请选择部署方式："
echo "1. 本地预览"
echo "2. 部署到 Vercel"
echo "3. 部署到 GitHub Pages"
echo "4. 部署到服务器"

read -p "请输入选择 (1-4): " choice

case $choice in
    1)
        echo "🌐 启动本地预览服务器..."
        npx serve dist -p 3000
        ;;
    2)
        echo "🚀 部署到 Vercel..."
        if ! command -v vercel &> /dev/null; then
            echo "安装 Vercel CLI..."
            npm install -g vercel
        fi
        vercel --prod
        ;;
    3)
        echo "📚 部署到 GitHub Pages..."
        echo "请按照 deploy-github-pages.md 中的步骤操作"
        ;;
    4)
        echo "🖥️  部署到服务器..."
        echo "请按照 deploy-server.md 中的步骤操作"
        ;;
    *)
        echo "❌ 无效选择"
        exit 1
        ;;
esac

echo "🎉 部署完成！" 