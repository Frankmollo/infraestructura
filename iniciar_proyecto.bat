@echo off
echo ========================================================
echo   INICIANDO ERP - LOS TRES (SISTEMA CON IA GROQ)
echo ========================================================

echo [1] Levantando Base de Datos y Servicios de Infraestructura (Docker)...
docker-compose up -d

echo [2] Esperando 5 segundos para que la BD este lista...
timeout /t 5 /nobreak >nul

echo [3] Iniciando MS Gestion Empresarial (Puerto 4001)...
start "MS Gestion Empresarial" cmd /c "cd ../ms-gestion-empresarial && npm run dev"

echo [4] Iniciando MS Documental DMS (Puerto 4003)...
start "MS Documental DMS" cmd /c "cd ../ms-documental-dms && npm run dev"

echo [5] Iniciando Backend de Hurtos (Puerto 4000)...
start "Backend Hurtos" cmd /c "cd ../backend && npm run dev"

echo [6] Iniciando Frontend Web Angular (Puerto 4200)...
start "Frontend Web (Angular)" cmd /c "cd ../frontendWeb && npm start"

echo ========================================================
echo  TODOS LOS SERVICIOS ESTAN INICIANDOSE EN NUEVAS VENTANAS
echo  POR FAVOR, NO CIERRES LAS NUEVAS VENTANAS NEGRAS (CMD)
echo ========================================================
echo.
echo El Frontend de Angular estara disponible pronto en:
echo http://localhost:4200
echo.
pause
