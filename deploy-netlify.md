# Netlify 部署指南（推荐）

## 为什么选择 Netlify？
- 更好的 SPA 路由支持
- 自动处理 MIME 类型问题
- 免费且稳定

## 部署步骤：

### 1. 注册 Netlify
访问：https://netlify.com
点击 "Sign up" 注册账号

### 2. 上传项目
1. 登录后点击 "Add new site"
2. 选择 "Deploy manually"
3. 将 `dist` 文件夹拖拽到上传区域
4. 等待部署完成

### 3. 自动部署（推荐）
1. 将代码推送到 GitHub
2. 在 Netlify 中选择 "Import from Git"
3. 选择你的仓库
4. 设置构建命令：`npm run build`
5. 设置发布目录：`dist`
6. 点击 "Deploy site"

## 优势：
- ✅ 自动 HTTPS
- ✅ 全球 CDN
- ✅ 自动部署
- ✅ 更好的路由支持
- ✅ 无 MIME 类型问题

## 访问地址：
部署完成后，Netlify 会给你一个类似这样的地址：
`https://your-site-name.netlify.app` 