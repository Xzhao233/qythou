@echo off
mshta vbscript:msgbox("��ر�һ��ɱ�����������Windows�����������ԱȨ�ޣ�������Windows��������߶������豸���и��ģ�����������ܻ�ʧ�ܣ�",64+4096,"֤�����")(window.close)
%1 %2
mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto runas","goto notadmin","runas",1)(window.close)&&exit
 
:runas
cd /d %~dp0
setlocal enabledelayedexpansion
certmgr.exe -add -c root.spc -s -r localMachine root>>%temp%\config.tmp
for /f "delims=" %%a in (%temp%\config.tmp) do (set var=%%a)
echo %var% | find "CertMgr Failed" > NUL && goto no
echo %var% | find "CertMgr Succeeded" > NUL && goto yes
del /f /q %temp%\config.tmp
 
:no
del /f /s %temp%\qythou.key
cls
mshta vbscript:msgbox("֤�鵼��ʧ�ܣ��볢�����¹ر�ɱ��������Թ���ԱȨ�����д˽ű���",64+4096,"֤�����")(window.close)
exit
 
:yes
echo CertMgr Succeeded>>%temp%\qythou.key
mshta vbscript:msgbox("֤�鵼��ɹ���",64+4096,"֤�����")(window.close)
exit