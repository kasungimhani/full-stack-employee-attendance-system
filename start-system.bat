@echo off
REM ABM System Quick Start Script for Windows
REM This script installs and starts both backend and frontend servers

echo.
echo ========================================
echo ABM Employee Attendance System Starter
echo ========================================
echo.

REM Check if Node.js is installed
node --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ERROR: Node.js is not installed!
    echo Please download and install Node.js from https://nodejs.org/
    pause
    exit /b 1
)

echo [✓] Node.js found
node --version

REM Check if MongoDB is running
echo.
echo Checking MongoDB connection...
mongo --eval "db.adminCommand('ping')" >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo [!] MongoDB is not running locally
    echo Please start MongoDB or use MongoDB Atlas
    echo For local MongoDB: mongod
    echo.
    pause
)

REM Setup Backend
echo.
echo ========================================
echo Installing Backend Dependencies...
echo ========================================
cd server
if not exist node_modules (
    call npm install
    if %errorlevel% neq 0 (
        echo Error installing backend dependencies
        pause
        exit /b 1
    )
) else (
    echo [✓] Backend dependencies already installed
)
cd ..

echo.
echo [✓] Backend setup complete

REM Setup Frontend
echo.
echo ========================================
echo Installing Frontend Dependencies...
echo ========================================
cd client
if not exist node_modules (
    call npm install
    if %errorlevel% neq 0 (
        echo Error installing frontend dependencies
        pause
        exit /b 1
    )
) else (
    echo [✓] Frontend dependencies already installed
)
cd ..

echo.
echo [✓] Frontend setup complete

REM Start servers
echo.
echo ========================================
echo Starting Servers...
echo ========================================
echo.
echo Two command windows will open:
echo - Window 1: Backend Server (http://localhost:5000)
echo - Window 2: Frontend Server (http://localhost:3000)
echo.
echo Close either window to stop that server.
echo.
pause

REM Start backend in new window
start "ABM Backend Server" cmd /k "cd server && npm start"
timeout /t 2 >nul

REM Start frontend in new window
start "ABM Frontend Server" cmd /k "cd client && npm start"

echo.
echo ========================================
echo Servers Starting...
echo ========================================
echo.
echo Backend: http://localhost:5000
echo Frontend: http://localhost:3000
echo.
echo The frontend should open automatically in your browser.
echo If not, open: http://localhost:3000
echo.
pause
