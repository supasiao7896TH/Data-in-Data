# =========================================================
#  setup-offline.ps1 — ดาวน์โหลด library ทั้งหมดลง vendor\
#  รันครั้งเดียวขณะมีอินเทอร์เน็ต แล้วก็อปทั้งโฟลเดอร์ไปเครื่องห้องควบคุม
#  ใช้งานบน Windows PowerShell 5+ หรือ PowerShell Core 7+
#
#  วิธีรัน (ถ้า execution policy ปิดอยู่ใช้คำสั่งนี้):
#    powershell -ExecutionPolicy Bypass -File setup-offline.ps1
# =========================================================
$ErrorActionPreference = "Stop"
$vendor = Join-Path $PSScriptRoot "vendor"
New-Item -ItemType Directory -Force -Path $vendor | Out-Null

$libs = @(
    @{ url = "https://unpkg.com/react@18.3.1/umd/react.production.min.js";                         out = "react.min.js";       label = "[1/6] React" },
    @{ url = "https://unpkg.com/react-dom@18.3.1/umd/react-dom.production.min.js";                 out = "react-dom.min.js";   label = "[2/6] ReactDOM" },
    @{ url = "https://cdn.sheetjs.com/xlsx-0.20.3/package/dist/xlsx.full.min.js";                  out = "xlsx.min.js";        label = "[3/6] xlsx (Excel)" },
    @{ url = "https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.min.js";                  out = "pdf.min.js";         label = "[4/6] pdf.js core" },
    @{ url = "https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.11.174/pdf.worker.min.js";           out = "pdf.worker.min.js";  label = "[5/6] pdf.js worker" },
    @{ url = "https://cdn.jsdelivr.net/npm/tesseract.js@5/dist/tesseract.min.js";                  out = "tesseract.min.js";   label = "[6/6] Tesseract OCR" }
)

$wc = New-Object System.Net.WebClient
foreach ($lib in $libs) {
    Write-Host "$($lib.label)..."
    $wc.DownloadFile($lib.url, (Join-Path $vendor $lib.out))
}
$wc.Dispose()

Write-Host ""
Write-Host "เสร็จแล้ว! ก็อปทั้งโฟลเดอร์ project\ ไปเครื่องห้องควบคุม"
Write-Host "เปิดใช้งาน: project\Boardman KB App.dc.html"
Write-Host ""
Write-Host "หมายเหตุ: OCR ครั้งแรกจะยังต้องดาวน์โหลด language model (~20 MB)"
Write-Host "          หลังจากนั้นจะถูก cache ไว้ในเครื่อง ใช้ออฟไลน์ได้"
