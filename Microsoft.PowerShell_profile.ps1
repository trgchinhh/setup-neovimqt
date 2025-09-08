# Hiển thị logo PowerShell khi mở
Write-Host ">>>> Powershell $($PSVersionTable.PSVersion) <<<<" -ForegroundColor Yellow
Write-Host "(modified by ChinhCuber)" -ForegroundColor DarkGray

Write-Host ""  # xuống hàng

function prompt {
    Write-Host '#' -NoNewline -ForegroundColor Red
    Write-Host 'chinhcuber' -NoNewline -ForegroundColor Cyan
    Write-Host '@ ' -NoNewline -ForegroundColor Magenta
    Write-Host (Get-Location).Path -NoNewline -ForegroundColor Green
    Write-Host '>' -NoNewline -ForegroundColor Red
    return ' '
}
