# 🚀 Netlify 部署指南

## 📋 准备工作已完成

✅ 项目已构建完成  
✅ 生成了部署包：`imagedefecthub-netlify.zip`  
✅ 删除了 Vercel 配置  

## 🌐 部署步骤

### 方法一：手动上传（推荐）

1. **访问 Netlify**
   - 打开浏览器，访问：https://netlify.com
   - 点击右上角 "Sign up" 注册账号

2. **注册账号**
   - 选择 "Continue with GitHub"（推荐）
   - 或者使用邮箱注册

3. **上传项目**
   - 登录后点击 "Add new site"
   - 选择 "Deploy manually"
   - 将 `imagedefecthub-netlify.zip` 文件拖拽到上传区域
   - 等待部署完成

### 方法二：GitHub 自动部署

1. **推送代码到 GitHub**
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   git remote add origin https://github.com/你的用户名/imagedefecthub.git
   git push -u origin main
   ```

2. **在 Netlify 中连接 GitHub**
   - 选择 "Import from Git"
   - 选择你的 GitHub 仓库
   - 设置构建命令：`npm run build`
   - 设置发布目录：`dist`
   - 点击 "Deploy site"

## 🎯 部署完成后

### 访问地址
Netlify 会给你一个类似这样的地址：
`https://your-site-name.netlify.app`

### 测试功能
1. **登录测试**：用户名 `admin`，密码 `123456`
2. **页面导航**：测试所有菜单项
3. **页面刷新**：确保路由正常工作

## 🔧 优势对比

| 功能 | Vercel | Netlify |
|------|--------|---------|
| SPA 路由支持 | ❌ 有问题 | ✅ 完美支持 |
| MIME 类型处理 | ❌ 有问题 | ✅ 自动处理 |
| 免费额度 | ✅ 充足 | ✅ 充足 |
| 部署速度 | ✅ 快 | ✅ 快 |
| 稳定性 | ⚠️ 一般 | ✅ 稳定 |

## 📞 如果遇到问题

1. **检查构建文件**：确保 `dist` 文件夹包含所有必要文件
2. **清除浏览器缓存**：Ctrl+Shift+R
3. **检查控制台错误**：F12 查看是否有错误信息

## 🎉 恭喜！

部署完成后，你的 ImageDefectHub 网站就可以正常访问了！ 