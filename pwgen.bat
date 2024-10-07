@echo off
color 0a
:Start
cls
title Password Generator

ECHO Password Generator Utility            

ping -n 3 -w 3000 0.0.0.1 > nul
echo 1 Input password length.
echo 2 Go To back menu.
echo 3 Exit.
echo.
set input=
set /p input= Choice:
if %input%==1 goto A if NOT goto Start
if %input%==2 goto start if NOT goto Start
if %input%==3 goto b if NOT goto Start

:A

set /P lengthnumberuser="What length do you want your password to be?   "

cls
Setlocal EnableDelayedExpansion
Set _RNDLength=%lengthnumberuser%
Set _Alphanumeric=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789
Set _Str=%_Alphanumeric%987654321

:_LenLoop
IF NOT "%_Str:~18%"=="" SET _Str=%_Str:~9%& SET /A _Len+=9& GOTO :_LenLoop
SET _tmp=%_Str:~9,1%
SET /A _Len=_Len+_tmp
Set _count=0
SET _RndAlphaNum=

:_loop
for /f "tokens=2 delims==" %%a in ('wmic OS Get localdatetime /value') do set "dt=%%a"
set "YY=%dt:~2,2%" & set "YYYY=%dt:~0,4%" & set "MM=%dt:~4,2%" & set "DD=%dt:~6,2%"
set "HH=%dt:~8,2%" & set "Min=%dt:~10,2%" & set "Sec=%dt:~12,2%"
set "datestamp=%YYYY%%MM%%DD%" & set "timestamp=%HH%%Min%%Sec%"
set "fullstamp=%YYYY%-%MM%-%DD%_%HH%-%Min%-%Sec%"
@REM change the file directory to save the output
set "file=C:\Users\joann\Desktop\projects\pw_gen\pw_list\%fullstamp%_pw_list.txt"
Set /a _count+=1
SET _RND=%Random%
Set /A _RND=_RND%%%_Len%
SET _RndAlphaNum=!_RndAlphaNum!!_Alphanumeric:~%_RND%,1!
If !_count! lss %_RNDLength% goto _loop

echo Password Generator Utility
echo ------------------------------
echo Password is: !_RndAlphaNum! > !file!

pause
goto start
:B
:Exit
exit