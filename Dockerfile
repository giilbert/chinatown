FROM oven/bun:latest

WORKDIR /app
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

COPY . .

RUN bun add serve@latest
RUN bun run build

EXPOSE 4321

CMD ["bun", "run", "serve", "-l", "4321", "dist"]