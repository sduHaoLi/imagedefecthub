# 🆓 免费后端替代方案

## 📋 当前情况
- Railway免费计划只能部署数据库
- 需要寻找其他免费后端服务

## 🎯 推荐方案

### 方案1：Railway数据库 + Render后端

#### 1. Railway数据库部署
1. **访问 Railway**：https://railway.app/
2. **创建新项目** → "Start from scratch"
3. **添加数据库**：
   - 点击 "New" → "Database" → "PostgreSQL"
   - 记录数据库连接信息

#### 2. Render后端部署
1. **访问 Render**：https://render.com/
2. **注册账户**（免费）
3. **创建新服务**：
   - 点击 "New" → "Web Service"
   - 连接你的GitHub仓库
   - 设置构建命令：`pip install -r requirements.txt`
   - 设置启动命令：`python start.py`

#### 3. 环境变量配置
```bash
# Render环境变量
DATABASE_URL=postgresql://your-railway-db-url
JWT_SECRET=your-secret-key
DEBUG=False
```

### 方案2：完全免费方案 - 使用SQLite

#### 1. 修改后端配置
将数据库改为SQLite（无需外部数据库）：

```python
# backend/config.py
DATABASE_URL = "sqlite:///./app.db"
```

#### 2. 部署到Render
- 使用SQLite作为数据库
- 无需Railway数据库服务

## 🔧 推荐配置

### 最佳组合：Render + SQLite

1. **Render后端**：
   - 免费Web服务
   - 自动部署
   - 支持Python/FastAPI
   - 内置SQLite支持

2. **Netlify前端**：
   - 免费静态网站托管
   - 自动部署

## 📝 部署步骤

### 步骤1：修改后端配置
1. 编辑 `backend/config.py`
2. 将数据库URL改为SQLite
3. 提交更改到GitHub

### 步骤2：Render后端部署
1. 访问 https://render.com/
2. 注册免费账户
3. 连接GitHub仓库
4. 设置环境变量
5. 部署

### 步骤3：Netlify前端部署
1. 访问 https://app.netlify.com/
2. 上传dist文件夹
3. 设置环境变量指向Render后端

## 💡 其他免费选项

### 1. Vercel Serverless Functions
- 免费额度：每月100GB小时
- 支持Python
- 适合轻量级API

### 2. Netlify Functions
- 免费额度：每月125,000次调用
- 支持多种语言
- 与前端同平台

### 3. Cloudflare Workers
- 免费额度：每天100,000次请求
- 支持多种语言
- 全球CDN

## 🚨 注意事项

1. **免费限制**：
   - 大多数免费服务有使用限制
   - 注意监控使用量

2. **数据库选择**：
   - SQLite：简单，但功能有限
   - PostgreSQL：功能强大，需要外部服务

3. **环境变量**：
   - 确保正确配置数据库连接
   - 保护好JWT密钥

## ✅ 推荐流程

1. **选择Render + SQLite**
2. **修改后端配置**
3. **部署Render后端**
4. **部署Netlify前端**
5. **测试连接**

---

*最后更新：2024年* 