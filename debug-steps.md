# 网站白屏调试步骤

## 1. 检查浏览器控制台
1. 打开网站
2. 按 F12 打开开发者工具
3. 查看 Console 标签页
4. 查看是否有红色错误信息

## 2. 常见错误及解决方案

### 错误1：API 连接失败
- 错误信息：`ECONNREFUSED` 或 `Failed to fetch`
- 原因：前端尝试连接后端 API，但后端未运行
- 解决：暂时注释掉 API 调用，使用模拟数据

### 错误2：路由问题
- 错误信息：`Cannot read property of undefined`
- 原因：Vue Router 配置问题
- 解决：检查路由配置

### 错误3：资源加载失败
- 错误信息：`Failed to load resource`
- 原因：静态资源路径错误
- 解决：检查资源路径

## 3. 临时解决方案
在 API 调用处添加错误处理，避免白屏 