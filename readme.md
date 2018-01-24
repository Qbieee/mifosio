# Mifosio

## 环境安装与配置(非docker方式启动)

### 安装Jdk8

### 安装Mysql

- port：3306
- username:root
- password:mysql

### 安装Cassandra

- 下载地址：http://www.apache.org/dyn/closer.lua/cassandra/3.11.1/apache-cassandra-3.11.1-bin.tar.gz
- 依赖python2.7
- windows下GUI下载地址：https://www.mongodbmanager.com/files/cassandramanager_inst.exe
- port:9042

### 安装Activemq

- 下载地址：http://activemq.apache.org/activemq-5152-release.html


## docker方式启动后端

1. 打WAR包

- 进入目录repakcage
- 执行 buildRepackage.bat
- 结果是打包生成war包，并复制到repackage目录下
- 注意：repackage目录下已经包含微服务注册工程jhipster-registry-3.2.4.war

2. 打Docker包

- 进入目录docker-compose
- 执行buildDocker.bat
- 结果是生成各个工程的docker image,使用`docker images`可查看

3. 启动环境

- 启动本地mysql
- 启动cassandra, docker-compose 目录下执行命令 `docker-compose -f cassandra.yml up -d`
- 启动activemq, docker-compose 目录下执行命令 `docker-compose -f activemq.yml up -d`
- 启动registry, docker-compose 目录下执行命令 `docker-compose -f registry.yml up -d`

4. 初始化数据

初始化数据在目录 datascript中

- 初始化mysql数据，数据位于 datascript/mysql中
- 初始化cassandra数据，数据位于 datascript/cassandra中
    - 将cassandra目录拷贝至 cassandra的volumn中
    - 然后通过docker进入cassandra命令行，`cd /var/lib/cassandra/data/xxx`，找到并执行autoMigrate.sh
    
5. 启动业务微服务

- docker-compose目录下执行`docker-compose up -d`


## 本地方式启动后端

后端目录为repakcage

1. 打WAR包

- 进入目录repakcage
- 执行 buildRepackage.bat
- 结果是打包生成war包，并复制到repackage目录下
- 注意：repackage目录下已经包含微服务注册工程jhipster-registry-3.2.4.war

2. 启动环境

- 启动本地mysql
- 启动本地cassandra
- 启动本地activemq


3. 初始化数据

初始化数据在目录 datascript中

- 初始化mysql数据，数据位于 datascript/mysql中
- 初始化cassandra数据，进入目录 datascript/cassandra，执行autoMigrate.bat

4. 启动registry微服务

- 进入repackage下
- 打开一个命令行窗口，执行`java -jar jhipster-registry-3.2.4.war` 
- 访问地址：http://localhost:8761   

5. 启动业务微服务

- 新打开一个命令行窗口，执行`java -jar mifosio-XXX.war`,执行11次


## 启动前端

前端nginx目录为frontend

- 前端程序打包：`npm run build`打包工程fims-web-app, 放置到frontend/nginx-1.12.2/fims
- 启动nginx: `start nginx.exe`
    - 停止nginx: `nginx.exe -s stop`
    - 修改nginx配置文件后重新启动：`nginx.exe -s reload`
- 访问地址：http://localhost:8888
