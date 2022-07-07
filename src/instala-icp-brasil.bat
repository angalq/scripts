@echo off
rem Instala os certificados ICP-Brasil no Windows

echo Verificando acesso de administrador...
cd %SystemRoot%\System32
net session >nul 2>&1
if not %ERRORLEVEL% equ 0 (
	echo Este script requer acesso de administrador
	pause
	exit /b 1
)
echo Acesso de administrador validado!

echo Instalando certificados ICP-Brasil...

set URL=http://acraiz.icpbrasil.gov.br/Certificado_AC_Raiz.crt
powershell -Command "(New-Object Net.WebClient).DownloadFile('%URL%', '%TEMP%\v1.crt')"
certutil -f -addstore Root %TEMP%\v1.crt
if not %ERRORLEVEL% equ 0 (
	echo Falha na instalacao do certificado AC Raiz da ICP-Brasil
	pause
	exit /b 1
)

set URL=http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasil.crt
powershell -Command "(New-Object Net.WebClient).DownloadFile('%URL%', '%TEMP%\v1.crt')"
certutil -f -addstore Root %TEMP%\v1.crt
if not %ERRORLEVEL% equ 0 (
	echo Falha na instalacao do certificado AC Raiz da ICP-Brasil V1
	pause
	exit /b 1
)

set URL=http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv2.crt
powershell -Command "(New-Object Net.WebClient).DownloadFile('%URL%', '%TEMP%\v2.crt')"
certutil -f -addstore Root %TEMP%\v2.crt
if not %ERRORLEVEL% equ 0 (
	echo Falha na instalacao do certificado AC Raiz da ICP-Brasil V2
	pause
	exit /b 1
)

set URL=http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv4.crt
powershell -Command "(New-Object Net.WebClient).DownloadFile('%URL%', '%TEMP%\v4.crt')"
certutil -f -addstore Root %TEMP%\v4.crt
if not %ERRORLEVEL% equ 0 (
	echo Falha na instalacao do certificado AC Raiz da ICP-Brasil V4
	pause
	exit /b 1
)

set URL=http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv5.crt
powershell -Command "(New-Object Net.WebClient).DownloadFile('%URL%', '%TEMP%\v5.crt')"
certutil -f -addstore Root %TEMP%\v5.crt
if not %ERRORLEVEL% equ 0 (
	echo Falha na instalacao do certificado AC Raiz da ICP-Brasil V5
	pause
	exit /b 1
)

set URL=http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv6.crt
powershell -Command "(New-Object Net.WebClient).DownloadFile('%URL%', '%TEMP%\v8.crt')"
certutil -f -addstore Root %TEMP%\v8.crt
if not %ERRORLEVEL% equ 0 (
	echo Falha na instalacao do certificado AC Raiz da ICP-Brasil V6
	pause
	exit /b 1
)

set URL=http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv7.crt
powershell -Command "(New-Object Net.WebClient).DownloadFile('%URL%', '%TEMP%\v8.crt')"
certutil -f -addstore Root %TEMP%\v8.crt
if not %ERRORLEVEL% equ 0 (
	echo Falha na instalacao do certificado AC Raiz da ICP-Brasil V7
	pause
	exit /b 1
)


set URL=http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv8.crt
powershell -Command "(New-Object Net.WebClient).DownloadFile('%URL%', '%TEMP%\v8.crt')"
certutil -f -addstore Root %TEMP%\v8.crt
if not %ERRORLEVEL% equ 0 (
	echo Falha na instalacao do certificado AC Raiz da ICP-Brasil V8
	pause
	exit /b 1
)

set URL=http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv9.crt
powershell -Command "(New-Object Net.WebClient).DownloadFile('%URL%', '%TEMP%\v9.crt')"
certutil -f -addstore Root %TEMP%\v9.crt
if not %ERRORLEVEL% equ 0 (
	echo Falha na instalacao do certificado AC Raiz da ICP-Brasil V9
	pause
	exit /b 1
)

set URL=http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv10.crt
powershell -Command "(New-Object Net.WebClient).DownloadFile('%URL%', '%TEMP%\v9.crt')"
certutil -f -addstore Root %TEMP%\v9.crt
if not %ERRORLEVEL% equ 0 (
	echo Falha na instalacao do certificado AC Raiz da ICP-Brasil V10 - SSL
	pause
	exit /b 1
)

set URL=http://acraiz.icpbrasil.gov.br/credenciadas/RAIZ/ICP-Brasilv11.crt
powershell -Command "(New-Object Net.WebClient).DownloadFile('%URL%', '%TEMP%\v9.crt')"
certutil -f -addstore Root %TEMP%\v9.crt
if not %ERRORLEVEL% equ 0 (
	echo Falha na instalacao do certificado AC Raiz da ICP-Brasil V11 - Assinatura de Código
	pause
	exit /b 1
)

set URL=http://acraiz.icpbrasil.gov.br/repositorio/v1_v2_v5_v6_v7_10_11_msie.p7b
powershell -Command "(New-Object Net.WebClient).DownloadFile('%URL%', '%TEMP%\msie.p7b')"
certutil -f -addstore CA %TEMP%\msie.p7b
if not %ERRORLEVEL% equ 0 (
	echo Falha na instalacao da cadeia de certificados para o Internet Explorer
	pause
	exit /b 1
)

set URL=http://acraiz.icpbrasil.gov.br/repositorio/v1_v2_v5_v6_v7_10_11_goochr.p7b
powershell -Command "(New-Object Net.WebClient).DownloadFile('%URL%', '%TEMP%\goochr.p7b')"
certutil -f -addstore CA %TEMP%\goochr.p7b
if not %ERRORLEVEL% equ 0 (
	echo Falha na instalacao da cadeia de certificados para o Google Chrome
	pause
	exit /b 1
)

echo Certificados ICP-Brasil instalados!
pause