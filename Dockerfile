FROM node:20-alpine

RUN corepack enable && corepack prepare pnpm@9.15.3 --activate

# native 模块（如 better-sqlite3）编译依赖；node-gyp 需要 python
RUN apk add --no-cache python3 make g++ && ln -sf /usr/bin/python3 /usr/bin/python

WORKDIR /app

COPY . /app

# 保留完整错误输出便于排查
RUN pnpm install --reporter=default


RUN pnpm run build

EXPOSE 3000

CMD pnpm run start:prod