FROM node:22-alpine AS base
WORKDIR /app
RUN apk add --no-cache python3 make g++ sqlite-dev
RUN corepack enable
COPY package.json ./
RUN npm i

# Build stage for production
FROM base AS build
COPY . ./
RUN npm run build

# Production image (default/final)
FROM node:22-alpine AS prod
WORKDIR /app
COPY --from=build /app/.output/ ./
ENV PORT=3000
ENV HOST=0.0.0.0
EXPOSE 3000
CMD ["node", "/app/server/index.mjs"]
