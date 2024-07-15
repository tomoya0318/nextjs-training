FROM node:18-alpine

WORKDIR /work

# corepackを有効化
RUN corepack enable

# Yarn 4.3.1を設定
RUN corepack prepare yarn@4.3.1 --activate

# 必要なファイルをコピー
COPY package.json yarn.lock* .yarnrc.yml ./

# # 依存関係をインストール
# RUN if [ -f yarn.lock ]; then yarn install --frozen-lockfile; \
#     else echo "Warning: Lockfile not found. It is recommended to commit lockfiles to version control." && yarn install; \
#     fi

RUN yarn install

# 残りの必要なファイルをコピー
COPY . ./

# デフォルトのコマンドを設定
CMD ["yarn", "dev"]
