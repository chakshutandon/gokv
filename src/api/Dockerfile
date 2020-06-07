FROM fpco/stack-build:lts-13.17 as build_base
WORKDIR /app
COPY . /app
RUN stack build
RUN stack install

# FROM alpine
# RUN adduser -S -D -H -h /raft raft
# USER raft
# COPY --from=build_base --chown=raft:root /app/.stack-work/install/x86_64-linux/lts-13.17/8.6.4/bin/raft-api-exe /raft/raft-api
EXPOSE 3000
CMD ["stack", "exec", "raft-api-exe"]
# CMD ["/raft/raft-api"]
