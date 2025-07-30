# ImageDefectHub - AI辅助图像缺陷识别与审核系统

一个基于 Vue 3 + FastAPI + YOLO 的完整图像缺陷识别与审核系统，支持图像上传、AI检测、人工审核、报告生成等功能。

## 🚀 项目特色

- **前端**: Vue 3 + Element Plus + Vite
- **后端**: FastAPI + SQLAlchemy + YOLO
- **AI模型**: YOLOv8 缺陷检测
- **数据库**: MySQL/PostgreSQL
- **部署**: 支持 Docker、Vercel、Netlify

## 📁 项目结构

```
ImageDefectHub/
├── frontend/                 # 前端项目
│   ├── src/
│   │   ├── api/             # API接口
│   │   ├── components/      # 组件
│   │   ├── pages/          # 页面
│   │   ├── router/         # 路由
│   │   ├── stores/         # 状态管理
│   │   └── style/          # 样式
│   ├── package.json
│   └── vite.config.js
├── backend/                  # 后端项目
│   ├── api/                # API路由
│   ├── models/             # 数据模型
│   ├── utils/              # 工具模块
│   ├── main.py             # 主应用
│   ├── requirements.txt    # Python依赖
│   └── README.md          # 后端说明
├── docs/                    # 文档
└── README.md               # 项目说明
```

## 🛠️ 快速开始

### 1. 克隆项目

```bash
git clone <repository-url>
cd ImageDefectHub
```

### 2. 启动后端服务

```bash
cd backend

# Windows
run.bat

# Linux/Mac
chmod +x run.sh
./run.sh
```

### 3. 启动前端服务

```bash
cd frontend

# 安装依赖
npm install

# 启动开发服务器
npm run dev
```

### 4. 访问应用

- 前端: http://localhost:5173
- 后端API: http://localhost:8000
- API文档: http://localhost:8000/docs

## 🔧 功能模块

### 1. 图像管理
- 拖拽上传图片
- 批量上传支持
- 图片预览和下载
- 图片列表管理
- 搜索和排序

### 2. 缺陷检测
- YOLO AI模型检测
- 实时检测结果
- 检测参数配置
- 批量检测支持
- 检测结果可视化

### 3. 缺陷审核
- 人工审核界面
- 审核状态管理
- 批量审核操作
- 审核历史记录
- 审核统计报告

### 4. 报告生成
- 单张图片报告
- 批量检测报告
- 统计汇总报告
- PDF/Excel/JSON格式
- 报告历史管理

### 5. 用户管理
- 用户注册登录
- 个人信息管理
- 头像上传
- 密码修改
- 用户统计

## 🔌 API接口

### 认证相关
- `POST /api/auth/login` - 用户登录
- `POST /api/auth/register` - 用户注册
- `POST /api/auth/logout` - 用户登出

### 图像管理
- `POST /api/images/upload` - 上传图片
- `GET /api/images/list` - 获取图片列表
- `DELETE /api/images/{id}` - 删除图片

### 缺陷检测
- `POST /api/detect/single` - 单张图片检测
- `POST /api/detect/batch` - 批量图片检测
- `GET /api/detect/config` - 获取检测配置

### 缺陷审核
- `GET /api/audit/list` - 获取审核列表
- `POST /api/audit/{id}` - 更新审核状态
- `POST /api/audit/batch` - 批量审核

### 报告生成
- `POST /api/reports/generate` - 生成报告
- `GET /api/reports/download/{id}` - 下载报告
- `GET /api/reports/history` - 获取报告历史

## 🤖 AI模型配置

### 1. 使用预训练模型
系统会自动下载并使用 YOLOv8n 预训练模型。

### 2. 使用自定义模型
将训练好的模型文件放在 `backend/models/` 目录：
```
backend/models/
└── best.pt  # 你的训练模型
```

### 3. 模型配置
在 `backend/.env` 中配置：
```env
MODEL_PATH=models/best.pt
CONFIDENCE_THRESHOLD=0.5
NMS_THRESHOLD=0.4
```

## 🗄️ 数据库配置

### 1. MySQL配置
```sql
CREATE DATABASE imagedefecthub CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### 2. 环境变量
```env
DATABASE_URL=mysql+pymysql://username:password@localhost:3306/imagedefecthub
```

## 🚀 部署指南

### 1. 前端部署 (Vercel/Netlify)

```bash
cd frontend
npm run build
```

### 2. 后端部署

#### 使用 Docker
```dockerfile
FROM python:3.9-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
EXPOSE 8000
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
```

#### 使用 Gunicorn
```bash
pip install gunicorn
gunicorn main:app -w 4 -k uvicorn.workers.UvicornWorker --bind 0.0.0.0:8000
```

### 3. 生产环境配置

```env
DEBUG=False
HOST=0.0.0.0
PORT=8000
SECRET_KEY=your-secure-secret-key
```

## 🔒 安全配置

### 1. JWT密钥
生产环境中请修改 JWT 密钥：
```env
SECRET_KEY=your-very-secure-secret-key-here
```

### 2. CORS配置
在 `backend/main.py` 中配置允许的域名：
```python
allow_origins=["http://localhost:5173", "https://yourdomain.com"]
```

### 3. 文件上传限制
```env
MAX_FILE_SIZE=10485760  # 10MB
```

## 📊 性能优化

### 1. 前端优化
- 代码分割和懒加载
- 图片压缩和缓存
- 组件按需加载

### 2. 后端优化
- 数据库连接池
- Redis缓存
- 异步处理
- 文件压缩

### 3. AI模型优化
- 模型量化
- GPU加速
- 批量处理

## 🔧 故障排除

### 1. 前端问题
- 检查API地址配置
- 验证网络连接
- 查看浏览器控制台

### 2. 后端问题
- 检查数据库连接
- 验证模型文件
- 查看服务器日志

### 3. AI检测问题
- 确认模型文件存在
- 检查图片格式
- 验证检测参数

## 📞 技术支持

### 1. 文档
- API文档: http://localhost:8000/docs
- 项目文档: `/docs/`

### 2. 日志
- 前端日志: 浏览器控制台
- 后端日志: 服务器输出

### 3. 常见问题
- 数据库连接失败
- 模型加载错误
- 文件上传失败
- API请求超时

## 🤝 贡献指南

1. Fork 项目
2. 创建功能分支
3. 提交更改
4. 推送到分支
5. 创建 Pull Request

## 📄 许可证

MIT License

## 🙏 致谢

- [Vue.js](https://vuejs.org/)
- [FastAPI](https://fastapi.tiangolo.com/)
- [YOLO](https://github.com/ultralytics/ultralytics)
- [Element Plus](https://element-plus.org/)

---

**ImageDefectHub** - 让AI辅助缺陷检测更简单、更高效！ 