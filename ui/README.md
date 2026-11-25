#### 打开cmd，不建议powershell，确保进入到项目的ui目录下
#### 检查node.js环境
  检查环境变量中所有与node.js相关的，全部删除
  先安装/doc/node.js/node-v12.13.1-x64.msi，默认安装
  安装/doc/node.js/nvm-setup.exe
  在终端中执行：nvm use 12.13.1
  重新打开项目

#### 运行项目
先运行后端
cd ui

#### 尝试安装yarn，yarn解释为Yet Another Resource Manager，能够更好地调度资源，在大数据等行业中，yarn会比npm快很多

npm -g install yarn

# 安装依赖

npm install
或
yarn

npm install --registry=https://registry.npmmirror.com
或
yarn --registry=https://registry.npmmirror.com

# 启动服务，以后启动服务只需在ui目录下执行 npm run dev

npm run dev
或
yarn dev

浏览器访问 http://localhost:8081

## 发布

# 构建生产环境

npm run build:prod