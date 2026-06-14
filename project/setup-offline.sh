#!/usr/bin/env bash
# =========================================================
#  setup-offline.sh — ดาวน์โหลด library ทั้งหมดลง vendor/
#  รันครั้งเดียวขณะมีอินเทอร์เน็ต แล้วก็อปทั้งโฟลเดอร์ไปเครื่องห้องควบคุม
#  ใช้งานบน Linux / macOS / WSL (มี curl)
# =========================================================
set -e
VENDOR="$(dirname "$0")/vendor"
mkdir -p "$VENDOR"

echo "[1/6] React..."
curl -sL "https://unpkg.com/react@18.3.1/umd/react.production.min.js" -o "$VENDOR/react.min.js"

echo "[2/6] ReactDOM..."
curl -sL "https://unpkg.com/react-dom@18.3.1/umd/react-dom.production.min.js" -o "$VENDOR/react-dom.min.js"

echo "[3/6] xlsx (Excel reader)..."
curl -sL "https://cdn.sheetjs.com/xlsx-0.20.3/package/dist/xlsx.full.min.js" -o "$VENDOR/xlsx.min.js"

echo "[4/6] pdf.js (PDF reader core)..."
curl -sL "https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js" -o "$VENDOR/pdf.min.js"

echo "[5/6] pdf.js worker..."
curl -sL "https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js" -o "$VENDOR/pdf.worker.min.js"

echo "[6/6] Tesseract.js (OCR)..."
curl -sL "https://cdn.jsdelivr.net/npm/tesseract.js@5/dist/tesseract.min.js" -o "$VENDOR/tesseract.min.js"

echo ""
echo "✅ เสร็จแล้ว! ตอนนี้ก็อปทั้งโฟลเดอร์ project/ ไปเครื่องห้องควบคุมได้เลย"
echo "   เปิดใช้งาน: project/Boardman KB App.dc.html"
echo ""
echo "หมายเหตุ: OCR ครั้งแรกจะยังต้องดาวน์โหลด language model (~20 MB)"
echo "          หลังจากนั้นจะถูก cache ไว้ในเครื่อง ใช้ออฟไลน์ได้"
