FROM comby/comby:latest as binary

# We have to create a new image because the binary image doesn't include Bash. We need Bash for entrypoint script.
FROM alpine:3.12

LABEL maintainer="Rijnard van Tonder <rvantonder@gmail.com>"
LABEL name="comby-action"
LABEL org.opencontainers.image.source="https://github.com/comby-tools/comby-action"

RUN apk --no-cache add bash pcre sqlite-dev curl

COPY --from=binary /usr/local/bin/comby /usr/local/bin/comby
COPY --from=binary /usr/local/bin/comby-third-party-licenses /usr/local/bin/comby-third-party-licenses

COPY entrypoint.sh /usr/local/bin

RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
