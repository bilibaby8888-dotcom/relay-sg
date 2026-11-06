# Render 版：与 Cloady 部署同构，密钥与端口在启动时从环境变量注入，仓库里只放占位符
FROM ghcr.io/xtls/xray-core:latest AS builder

FROM alpine:latest
RUN apk add --no-cache ca-certificates tzdata
COPY --from=builder /usr/local/bin/xray /usr/local/bin/xray
COPY config.json /usr/local/etc/xray/config.json
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/bin/sh", "/start.sh"]
