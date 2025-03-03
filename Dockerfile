# ใช้ Nginx เป็น Web Server
FROM nginx:latest

# ตั้งค่าโฟลเดอร์ที่ใช้เก็บไฟล์เว็บไซต์
WORKDIR /usr/share/nginx/html

# คัดลอกเฉพาะไฟล์ด้านใน GameWebPJ ไปยังโฟลเดอร์ของ Nginx
COPY GameWebPJ/ . 

# เปิดพอร์ต 80 สำหรับ HTTP
EXPOSE 80

# คำสั่งเริ่มต้นให้ Nginx ทำงาน
CMD ["nginx", "-g", "daemon off;"]
