# ใช้ Node.js รุ่น Alpine
FROM node:alpine

# ตั้งพื้นที่ทำงาน
WORKDIR /app

# ก๊อปปี้ package.json จากโฟลเดอร์ todo_backend
COPY TODO/todo_backend/package*.json ./

# ติดตั้ง Library
RUN npm install --production

# ก๊อปปี้ไฟล์ทั้งหมดจาก todo_backend เข้ามา (รวม server.js)
COPY TODO/todo_backend/ .

# Port ที่แอปทำงาน (ตามโจทย์)
EXPOSE 5000

# รันแอป
CMD ["node", "server.js"]