# 得到golang docker 最新镜像
FROM golang:latest

# 在容器内部创建一个目录来存储我们的 web 应用，接着使它成为工作目录
RUN mkdir -p /go/src/app
WORKDIR /go/src/app

# 复制go文件目录到容器中
COPY . /go/src/app

# 下载并安装第三方依赖到容器中
#RUN go-wrapper download
#RUN go-wrapper install

RUN go get -d -v
RNU go install -v

# 设置 PORT 环境变量
ENV PORT 8080

# 给主机暴露 8080 端口，这样外部网络可以访问你的应用
EXPOSE 8080

# 告诉 Docker 启动容器运行的命令
CMD ["go-wrapper", "run"]