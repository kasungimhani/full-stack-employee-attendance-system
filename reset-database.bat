@echo off
REM Database Reset Script - Clears and resets MongoDB data
REM WARNING: This will delete all data from the database!

echo.
echo ========================================
echo ABM Database Reset Tool
echo ========================================
echo.
echo WARNING: This will delete ALL data from the database!
echo This action CANNOT be undone.
echo.

set /p confirm="Are you sure? Type 'yes' to continue: "

if /i not "%confirm%"=="yes" (
    echo Reset cancelled.
    exit /b 0
)

echo.
echo Connecting to MongoDB...
echo.

REM This assumes MongoDB is running locally
REM You can modify the connection string if using MongoDB Atlas
mongo 127.0.0.1:27017/abm_consulting --eval "db.dropDatabase()" >nul 2>&1

if %errorlevel% equ 0 (
    echo [✓] Database reset successful!
    echo.
    echo The following collections have been removed:
    echo - users
    echo - attendances
    echo - leaverequests
    echo.
    echo The database is now empty and ready for fresh data.
) else (
    echo ERROR: Could not connect to MongoDB
    echo Make sure MongoDB is running on localhost:27017
)

echo.
pause
