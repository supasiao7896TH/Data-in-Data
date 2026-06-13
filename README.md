# คลังความรู้ Boardman (Boardman KB App)

Web App สำหรับ Boardman โรงงานปิโตรเคมี — เก็บ/ค้นหาข้อมูล tag, setpoint, ขั้นตอน, interlock ฯลฯ
ทำงานในเครื่องโดยไม่ต้องต่อเน็ต (หลังรัน setup ครั้งแรก)

## วิธีเริ่มใช้งาน (ครั้งแรก)

### 1. ดาวน์โหลด library (ต้องมีอินเทอร์เน็ตแค่ครั้งนี้ครั้งเดียว)

**Windows** — เปิด PowerShell แล้วรัน:
```powershell
powershell -ExecutionPolicy Bypass -File project\setup-offline.ps1
```

**Linux / macOS / WSL**:
```bash
bash project/setup-offline.sh
```

### 2. เปิดแอป

ดับเบิลคลิก `project/Boardman KB App.dc.html` ในเบราว์เซอร์ (Chrome / Edge แนะนำ)

### 3. ย้ายไปเครื่องห้องควบคุม

ก็อปโฟลเดอร์ `project/` ทั้งโฟลเดอร์ (รวม `vendor/`) ใส่ USB แล้วย้ายไปเครื่องปลายทาง
เปิดไฟล์ `Boardman KB App.dc.html` — ใช้งานออฟไลน์ได้ทันที

---

## สิ่งที่ทำได้

- 📎 ลากไฟล์ **PDF / Excel** มาวาง → ดึงข้อความ + เดา tag และหมวดให้อัตโนมัติ
- 📋 กด **Ctrl+V** วางภาพแคปหน้าจอ DCS → เก็บภาพ + ปุ่ม OCR อ่านตัวอักษรออกมา
- ✍️ พิมพ์/จดเองพร้อมเลือกหมวดและสถานะ (ปกติ / เฝ้าระวัง / วิกฤต)
- 🔍 ค้นหาทันที กรองจาก tag/ชื่อ/เนื้อหา/หมวด
- ⭐ ปักหมุดของด่วนขึ้นบนสุด · แก้ไข/ลบได้
- 💾 เก็บในเครื่อง (localStorage) ปิด-เปิดใหม่ข้อมูลยังอยู่

## โครงสร้างโฟลเดอร์

```
project/
  Boardman KB App.dc.html   ← ไฟล์หลัก เปิดนี้ในเบราว์เซอร์
  Boardman Knowledge Base.dc.html  ← ต้นแบบ Phase 1 (อ้างอิง)
  support.js                ← DC runtime framework
  setup-offline.sh          ← setup script (Linux/Mac)
  setup-offline.ps1         ← setup script (Windows)
  vendor/                   ← ดาวน์โหลดโดย setup script (ไม่ track ใน git)
    react.min.js
    react-dom.min.js
    xlsx.min.js
    pdf.min.js
    pdf.worker.min.js
    tesseract.min.js
```

## หมายเหตุเรื่อง OCR

ฟีเจอร์ "อ่านข้อความจากภาพ" ใช้ Tesseract.js — library หลักอยู่ใน `vendor/`
แต่ **language model** (ไฟล์ `eng.traineddata` / `tha.traineddata` รวมกัน ~20 MB)
ยังต้องดาวน์โหลดในครั้งแรกที่กด "อ่านข้อความจากภาพ" หลังจากนั้นจะ cache ในเบราว์เซอร์
และใช้ออฟไลน์ได้โดยไม่ต้องดาวน์โหลดซ้ำ
