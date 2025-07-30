# Vercel 部署指南

## 1. 准备工作
1. 注册 Vercel 账号：https://vercel.com
2. 安装 Vercel CLI：`npm i -g vercel`

## 2. 部署步骤
```bash
# 1. 登录 Vercel
vercel login

# 2. 在项目根目录部署
vercel

# 3. 按提示操作：
# - 选择项目名称
# - 确认部署设置
# - 等待部署完成
```

## 3. 自动部署
将代码推送到 GitHub，Vercel 会自动部署：
```bash
git add .
git commit -m "Deploy to Vercel"
git push
```

## 4. 自定义域名
1. 在 Vercel 控制台选择项目
2. Settings → Domains
3. 添加你的域名

## 5. 环境变量配置
在 Vercel 控制台设置环境变量：
- `VITE_API_BASE_URL`: 你的后端 API 地址

## 优势
- 自动 HTTPS
- 全球 CDN
- 自动部署
- 免费额度充足 