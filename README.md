## nextjsをdockerでsetupするための勉強用

1. `package.json`に以下を追加
```
"packageManager": "yarn@4.3.1"
```
2. プロジェクトのルートに`.yarnrc.yml`を追加し，以下を記述
```
nodeLinker: node-modules
```
3. `Dockerfile`に以下を追加
```
# corepackを有効化
RUN corepack enable

# 必要なファイルをコピー
COPY package.json yarn.lock* .yarnrc.yml ./

RUN yarn install
```