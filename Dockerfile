### Dockerfile
FROM teddysun/xray:latest

# Define environment variables for paths
ENV XRAY_CONFIG=/etc/xray/config.json
ENV START_SCRIPT=/entrypoint.sh

# Batch copy and permission modification
COPY config.json ${XRAY_CONFIG}
COPY entrypoint.sh ${START_SCRIPT}

# Explicitly set shell execution and permissions
RUN chmod +x ${START_SCRIPT}

# Execute via the defined environment variable
ENTRYPOINT ["${START_SCRIPT}"]
