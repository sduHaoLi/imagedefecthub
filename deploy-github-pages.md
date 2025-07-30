# GitHub Pages 部署指南

## 1. 准备工作
1. 在 GitHub 创建新仓库，命名为 `imagedefecthub`
2. 将代码推送到仓库

## 2. 构建前端
```bash
npm run build
```

## 3. 配置 GitHub Pages
1. 进入仓库 Settings → Pages
2. Source 选择 "Deploy from a branch"
3. Branch 选择 "main"，文件夹选择 "/ (root)"
4. 点击 Save

## 4. 部署步骤
```bash
# 1. 初始化 Git 仓库
git init
git add .
git commit -m "Initial commit"

# 2. 添加远程仓库
git remote add origin https://github.com/你的用户名/imagedefecthub.git

# 3. 推送到 GitHub
git branch -M main
git push -u origin main

# 4. 构建并部署
npm run build
# 将 dist 文件夹内容复制到仓库根目录
cp -r dist/* .
git add .
git commit -m "Deploy to GitHub Pages"
git push
```

## 5. 访问网站
部署完成后，访问：`https://你的用户名.github.io/imagedefecthub`

## 注意事项
- 需要配置 API 代理或使用真实后端
- 静态托管无法运行后端服务
- 适合演示和展示用途 