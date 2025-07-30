# 云服务器部署指南

## 1. 购买服务器
- 阿里云 ECS 或腾讯云 CVM
- 配置建议：2核4G，带宽 5Mbps
- 系统：Ubuntu 20.04 或 CentOS 7

## 2. 服务器环境配置
```bash
# 更新系统
sudo apt update && sudo apt upgrade -y

# 安装 Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# 安装 Nginx
sudo apt install nginx -y

# 安装 PM2
sudo npm install -g pm2

# 安装 Git
sudo apt install git -y
```

## 3. 部署前端
```bash
# 1. 克隆代码
git clone https://github.com/你的用户名/imagedefecthub.git
cd imagedefecthub

# 2. 安装依赖
npm install

# 3. 构建项目
npm run build

# 4. 配置 Nginx
sudo nano /etc/nginx/sites-available/imagedefecthub
```

## 4. Nginx 配置
```nginx
server {
    listen 80;
    server_name your-domain.com;  # 替换为你的域名
    
    root /var/www/imagedefecthub/dist;
    index index.html;
    
    location / {
        try_files $uri $uri/ /index.html;
    }
    
    location /api {
        proxy_pass http://localhost:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
    }
}
```

## 5. 启用配置
```bash
# 创建软链接
sudo ln -s /etc/nginx/sites-available/imagedefecthub /etc/nginx/sites-enabled/

# 测试配置
sudo nginx -t

# 重启 Nginx
sudo systemctl restart nginx
```

## 6. 部署后端（Python）
```bash
# 安装 Python 环境
sudo apt install python3 python3-pip -y

# 创建后端目录
mkdir /var/www/backend
cd /var/www/backend

# 安装依赖
pip3 install fastapi uvicorn python-multipart

# 启动后端服务
pm2 start "uvicorn main:app --host 0.0.0.0 --port 8000" --name "imagedefecthub-backend"
```

## 7. 配置防火墙
```bash
sudo ufw allow 80
sudo ufw allow 443
sudo ufw allow 22
sudo ufw enable
```

## 8. 配置 SSL（可选）
```bash
# 安装 Certbot
sudo apt install certbot python3-certbot-nginx -y

# 获取 SSL 证书
sudo certbot --nginx -d your-domain.com
```

## 9. 访问网站
- HTTP: http://your-domain.com
- HTTPS: https://your-domain.com

## 维护命令
```bash
# 查看服务状态
pm2 status
sudo systemctl status nginx

# 重启服务
pm2 restart imagedefecthub-backend
sudo systemctl restart nginx

# 查看日志
pm2 logs imagedefecthub-backend
sudo tail -f /var/log/nginx/access.log
``` 