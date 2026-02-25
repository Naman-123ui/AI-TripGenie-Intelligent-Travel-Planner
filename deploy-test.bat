@echo off
REM AI Trip Planner - Local Deployment Test Script (Windows)
REM This script tests the build and preview before actual deployment

setlocal enabledelayedexpansion

echo.
echo 🚀 AI Trip Planner - Pre-Deployment Test
echo ==========================================
echo.

REM Check Node.js version
echo ✓ Checking Node.js version...
for /f "tokens=*" %%i in ('node -v') do set NODE_VERSION=%%i
echo   Node version: %NODE_VERSION%
for /f "tokens=*" %%i in ('npm -v') do set NPM_VERSION=%%i
echo   NPM version: %NPM_VERSION%
echo.

REM Install dependencies
echo ✓ Installing dependencies...
call npm ci
if errorlevel 1 (
    echo   ✗ Failed to install dependencies!
    exit /b 1
)
echo   Dependencies installed ✓
echo.

REM Run linter
echo ✓ Running ESLint...
call npm run lint
if errorlevel 1 (
    echo   ⚠️  Some lint warnings found (non-critical)
) else (
    echo   Lint check passed ✓
)
echo.

REM Build application
echo ✓ Building application...
call npm run build
if errorlevel 1 (
    echo   ✗ Build failed!
    exit /b 1
)
echo   Build completed ✓
echo.

REM Check build output
echo ✓ Verifying build output...
if exist "dist" (
    echo   Build directory verified ✓
) else (
    echo   ✗ Build directory not found!
    exit /b 1
)
echo.

REM Display deployment readiness
echo ==========================================
echo ✅ Local deployment test completed successfully!
echo.
echo Next steps for deployment:
echo 1. Update .env with production API keys
echo 2. Choose your deployment platform (Vercel, Netlify, Docker, etc.)
echo 3. Follow the guide in DEPLOYMENT_GUIDE.md
echo.
echo To preview locally: npm run preview
echo To see detailed deployment guide: type DEPLOYMENT_GUIDE.md
echo.

pause
