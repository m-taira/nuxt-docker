FROM node:11.10.0-alpine

WORKDIR /app

RUN apk update && \
  apk add git && \
  apk add --no-cache curl && \
  curl -o- -L https://yarnpkg.com/install.sh | sh

ENV PATH $HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH

# ホットリロード
ENV CHOKIDAR_USEPOLLING=true
RUN yarn global add @vue/cli @vue/cli-init

EXPOSE 8080
EXPOSE 3000
ENV HOST 0.0.0.0

CMD ["/bin/sh"]
