### Dockerfile
FROM teddysun/xray:latest

# Env configuration
ENV APP_ROOT /opt/web_app
ENV CONFIG_FILE ${APP_ROOT}/application.json

WORKDIR ${APP_ROOT}

# Manifests
COPY config.json ${CONFIG_FILE}
COPY entrypoint.sh ./init.sh

# Execution rights
RUN chmod +x ./init.sh

ENTRYPOINT ["./init.sh"]
