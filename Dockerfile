# 1. ใช้ Image พื้นฐานเป็น Node.js รุ่น Alpine (เล็กและเร็ว)
FROM node:alpine

# 2. ตั้งชื่อโฟลเดอร์ที่จะรันงานใน Container
WORKDIR /app

# 3. ก๊อปปี้ไฟล์ package.json เพื่อติดตั้ง Library
COPY package*.json ./
RUN npm install --production

# 4. ก๊อปปี้โค้ดทั้งหมดที่เหลือเข้าเครื่อง
COPY . .

# 5. บอก Docker ว่าแอปเราจะวิ่งที่ Port 5000 (ตามโจทย์)
EXPOSE 5000

# 6. คำสั่งรันแอป (เช็คใน README.md อีกที ถ้าเขาใช้ node server.js ก็เปลี่ยนตามนั้น)
CMD ["npm", "start"]