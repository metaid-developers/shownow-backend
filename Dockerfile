FROM node:22-alpine

RUN corepack enable && corepack prepare pnpm@9.15.3 --activate

# 安装 native 模块（如 better-sqlite3）编译所需依赖
RUN apk add --no-cache python3 make g++

WORKDIR /app

COPY . /app

RUN pnpm install


RUN pnpm run build

EXPOSE 3000

CMD pnpm run start:prod