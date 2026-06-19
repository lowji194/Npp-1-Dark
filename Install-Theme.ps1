# Đường dẫn tải các file theme và syntax highlight
$themeUrl     = "https://raw.githubusercontent.com/lowji194/Npp-1-Dark/refs/heads/main/Npp-1-Dark.xml"
$sassUrl      = "https://raw.githubusercontent.com/lowji194/Npp-1-Dark/refs/heads/main/Npp-1-Dark-Sass.xml"
$mikthemeUrl  = "https://raw.githubusercontent.com/lowji194/Npp-1-Dark/refs/heads/main/MikroTikScript.xml"
$darttheme    = "https://raw.githubusercontent.com/lowji194/Npp-1-Dark/refs/heads/main/Dart_DarkModeDefault.xml"

# Đường dẫn lưu file theme và syntax
$themePath    = "$env:APPDATA\Notepad++\themes\Npp-1-Dark.xml"
$sassPath     = "$env:APPDATA\Notepad++\userDefineLangs\Npp-1-Dark-Sass.xml"
$mikthemePath = "$env:APPDATA\Notepad++\userDefineLangs\MikroTikScript.xml"
$dartPath     = "$env:APPDATA\Notepad++\userDefineLangs\Dart_DarkModeDefault.xml"

# Tạo thư mục theme nếu chưa tồn tại
if (!(Test-Path "$env:APPDATA\Notepad++\themes")) {
    Write-Host "Tạo thư mục themes..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path "$env:APPDATA\Notepad++\themes" | Out-Null
}

# Tạo thư mục userDefineLangs nếu chưa tồn tại
if (!(Test-Path "$env:APPDATA\Notepad++\userDefineLangs")) {
    Write-Host "Tạo thư mục userDefineLangs..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path "$env:APPDATA\Notepad++\userDefineLangs" | Out-Null
}

# Tải theme
Write-Host "Đang tải theme Npp-1-Dark..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $themeUrl -OutFile $themePath

# Tải Sass Syntax Highlighting
Write-Host "Đang tải Npp-1-Dark-Sass..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $sassUrl -OutFile $sassPath

# Tải Mikrotik Script Syntax Highlighting
Write-Host "Đang tải MikroTikScript..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $mikthemeUrl -OutFile $mikthemePath

# Tải Dart Syntax Highlighting
Write-Host "Đang tải Dart_DarkModeDefault..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $darttheme -OutFile $dartPath

# Kiểm tra kết quả tải
if (Test-Path $themePath) {
    Write-Host "Theme Npp-1-Dark đã được cài đặt thành công!" -ForegroundColor Green
    Write-Host "Mở Notepad++, vào Settings -> Style Configurator, chọn theme 'Npp-1-Dark' và Save & Close."
} else {
    Write-Host "Lỗi: Không thể tải theme. Kiểm tra kết nối mạng và thử lại." -ForegroundColor Red
}

if (Test-Path $sassPath) {
    Write-Host "Sass Syntax Highlighting đã được cài đặt thành công!" -ForegroundColor Green
    Write-Host "Mở Notepad++, vào Language -> Define your language, chọn Npp-1-Dark-Sass và Import." -ForegroundColor Green
} else {
    Write-Host "Lỗi: Không thể tải Sass Syntax Highlighting. Kiểm tra kết nối mạng và thử lại." -ForegroundColor Red
}

if (Test-Path $mikthemePath) {
    Write-Host "MikroTikScript Syntax Highlighting đã được cài đặt thành công!" -ForegroundColor Green
    Write-Host "Mở Notepad++, vào Language -> Define your language, chọn MikroTikScript và Import." -ForegroundColor Green
} else {
    Write-Host "Lỗi: Không thể tải MikroTikScript. Kiểm tra kết nối mạng và thử lại." -ForegroundColor Red
}

if (Test-Path $dartPath) {
    Write-Host "Dart Syntax Highlighting đã được cài đặt thành công!" -ForegroundColor Green
    Write-Host "Mở Notepad++, vào Language -> Define your language, chọn Dart_DarkModeDefault và Import." -ForegroundColor Green
} else {
    Write-Host "Lỗi: Không thể tải Dart Syntax Highlighting. Kiểm tra kết nối mạng và thử lại." -ForegroundColor Red
}

pause
