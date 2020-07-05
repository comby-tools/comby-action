FROM comby/comby:latest

LABEL maintainer="Rijnard van Tonder <rvantonder@gmail.com>"
LABEL name="comby-action"
LABEL org.opencontainers.image.source="https://github.com/comby-tools/comby-action"

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"] 
