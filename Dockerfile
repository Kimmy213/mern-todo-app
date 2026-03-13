
FROM node:alpine AS build
WORKDIR /app
COPY TODO/todo_frontend/package*.json ./
RUN npm install
COPY TODO/todo_frontend/ .
RUN npm run build


FROM node:alpine
WORKDIR /app
COPY TODO/todo_backend/package*.json ./
RUN npm install --production
COPY TODO/todo_backend/ .


COPY --from=build /app/build ./static/build

EXPOSE 5000
CMD ["node", "server.js"]