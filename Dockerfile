FROM node:14.11-slim as builder
WORKDIR /app

COPY ./package.json ./package-lock.json ./

RUN npm ci

COPY ./tsconfig.json ./tsconfig.build.json ./
COPY ./src ./src

RUN NODE_ENV=production npm run build




FROM node:14.11-slim as fetcher
WORKDIR /app

COPY ./package.json ./package-lock.json ./

ENV NODE_ENV=production
RUN npm ci




FROM node:14.11-slim
WORKDIR /app

COPY --from=fetcher /app/node_modules /app/node_modules
COPY ./package.build.json /app/package.json
COPY ./tsconfig.json /app/tsconfig.json

COPY --from=builder /app/dist /app/dist

CMD ["--loader", "@k-foss/ts-esnode", "--experimental-modules", "--experimental-specifier-resolution=node", "--harmony-top-level-await", "./"]