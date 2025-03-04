# ใช้ Nginx เป็น Web Server
FROM nginx:latest

# ตั้งค่าโฟลเดอร์ที่ใช้เก็บไฟล์เว็บไซต์
WORKDIR /usr/share/nginx/html

# คัดลอกทุกไฟล์จากโฟลเดอร์ปัจจุบันไปยัง Nginx
COPY ./ .

# ใช้ ENTRYPOINT Script เพื่ออัปเดตชื่อ VM ก่อนรัน Nginx
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# เปิดพอร์ต 80 สำหรับ HTTP
ENTRYPOINT ["/entrypoint.sh"]
EXPOSE 80

# คำสั่งเริ่มต้นให้ Nginx ทำงาน
CMD ["nginx", "-g", "daemon off;"]
