FROM node:18-alpine

WORKDIR /work

# corepackを有効化
RUN corepack enable

# 必要なファイルをコピー
COPY package.json yarn.lock* .yarnrc.yml ./

RUN yarn install

# 残りの必要なファイルをコピー
COPY . ./

# デフォルトのコマンドを設定
CMD ["yarn", "dev"]
