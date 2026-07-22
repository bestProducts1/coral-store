@echo off
chcp 65001 >nul

:: 🔴 核心修复：强制锁定工作目录为当前 .bat 文件所在的文件夹
cd /d "%~dp0"

echo 正在当前项目目录中添加修改的文件...
git add .

echo 正在提交本地修改...
git commit -m "auto update"

echo 正在同步并推送到 GitHub...
git push origin main

echo.
if %errorlevel% equ 0 (
    echo ==========================================
    echo 🎉 成功！当前网站代码已顺利同步到 GitHub！
    echo ==========================================
) else (
    echo ==========================================
    echo ❌ 推送失败，可能是网络波动或有冲突。
    echo ==========================================
)

pause