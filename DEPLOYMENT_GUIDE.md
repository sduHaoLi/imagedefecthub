# 🚀 ImageDefectHub 完整部署指南

## 📋 部署概览

本项目包含：
- **前端**：Vue 3 + Element Plus (已构建完成)
- **后端**：Python FastAPI + YOLO (已配置完成)

## 🎯 部署方案

### 方案1：Netlify + Railway (推荐)

#### 前端部署到Netlify

1. **访问 Netlify**：https://app.netlify.com/
2. **登录账户**
3. **点击 "Add new site" → "Deploy manually"**
4. **上传 `dist` 文件夹**（整个文件夹拖拽）
5. **等待部署完成**
6. **记录生成的域名**（如：https://your-app-name.netlify.app）

#### 后端部署到Railway

1. **访问 Railway**：https://railway.app/
2. **使用GitHub登录**
3. **点击 "New Project" → "Deploy from GitHub repo"**
4. **选择你的GitHub仓库**
5. **设置环境变量**：
   ```
   DATABASE_URL=sqlite:///./app.db
   JWT_SECRET=your-secret-key
   DEBUG=False
   ```
6. **等待部署完成**
7. **记录生成的域名**（如：https://your-backend.railway.app）

#### 连接前后端

1. **在Netlify中设置环境变量**：
   - 进入你的Netlify项目
   - 点击 "Site settings" → "Environment variables"
   - 添加：`VITE_API_BASE_URL=https://your-backend.railway.app`

2. **重新部署前端**：
   - 在Netlify中点击 "Trigger deploy" → "Deploy site"

### 方案2：Vercel + Railway

#### 前端部署到Vercel

1. **访问 Vercel**：https://vercel.com/
2. **使用GitHub登录**
3. **点击 "New Project"**
4. **导入你的GitHub仓库**
5. **设置构建配置**：
   - Framework Preset: Vite
   - Build Command: `npm run build`
   - Output Directory: `dist`
6. **点击 "Deploy"**

#### 后端部署（同上）

### 方案3：本地部署

#### 前端本地运行

```bash
# 安装依赖
npm install

# 启动开发服务器
npm run dev
```

#### 后端本地运行

```bash
# 进入后端目录
cd backend

# 创建虚拟环境
python -m venv venv

# 激活虚拟环境
# Windows:
venv\Scripts\activate
# macOS/Linux:
source venv/bin/activate

# 安装依赖
pip install -r requirements.txt

# 启动服务器
python start.py
```

## 🔧 配置说明

### 前端配置

- **API代理**：已配置在 `vite.config.js`
- **路由**：使用 Vue Router
- **状态管理**：使用 Pinia
- **UI框架**：Element Plus

### 后端配置

- **框架**：FastAPI
- **AI模型**：YOLOv8 (ultralytics)
- **数据库**：SQLite (可配置为MySQL)
- **认证**：JWT
- **文件存储**：本地存储 (可配置为MinIO)

## 🌐 域名配置

### 自定义域名

1. **Netlify**：
   - 进入 "Domain settings"
   - 点击 "Add custom domain"
   - 按照提示配置DNS

2. **Railway**：
   - 进入项目设置
   - 点击 "Domains"
   - 添加自定义域名

## 🔒 安全配置

### 环境变量

确保设置以下环境变量：

```bash
# 后端
JWT_SECRET=your-very-secure-secret-key
DATABASE_URL=your-database-url
DEBUG=False

# 前端
VITE_API_BASE_URL=your-backend-url
```

### CORS配置

后端已配置CORS，允许前端域名访问。

## 📊 监控和维护

### 日志查看

- **Netlify**：在 "Functions" 标签页查看日志
- **Railway**：在 "Deployments" 标签页查看日志

### 性能监控

- 使用浏览器开发者工具监控前端性能
- 使用Railway的监控功能查看后端性能

## 🚨 故障排除

### 常见问题

1. **前端白屏**：
   - 检查API地址配置
   - 检查网络连接
   - 查看浏览器控制台错误

2. **后端连接失败**：
   - 检查环境变量配置
   - 检查数据库连接
   - 查看Railway日志

3. **AI模型加载失败**：
   - 检查模型文件路径
   - 检查依赖安装
   - 查看错误日志

### 联系支持

如遇到问题，请：
1. 查看部署平台的文档
2. 检查项目README文件
3. 查看错误日志

## ✅ 部署检查清单

- [ ] 前端构建成功
- [ ] 后端代码完整
- [ ] 环境变量配置正确
- [ ] 域名配置完成
- [ ] 前后端连接正常
- [ ] 功能测试通过
- [ ] 安全配置完成

## 🎉 部署完成

部署完成后，你的ImageDefectHub系统就可以正常使用了！

**访问地址**：你的Netlify域名
**API地址**：你的Railway域名

---

*最后更新：2024年* 