@echo off
rem ����һ����������д��ʾ������

rem ��ȡ��ǰĿ¼�µ�qylc.exe������·��
set qylc_path=%cd%\qylc.exe

rem ��ע����д���.qy�ļ����͵ļ���������Ĭ��ֵΪqylcfile
reg add HKCR\.qy /ve /d qylcfile /f

rem ��ע����д���qylcfile����������Ĭ��ͼ��Ϊqylc.exe��ͼ��
reg add HKCR\qylcfile /ve /d "qythou Դ�����ļ�" /f
reg add HKCR\qylcfile\DefaultIcon /ve /d "%qylc_path%,0" /f

rem ��qylcfile���´���shell\open\command����������Ĭ��ֵΪqylc.exe�����ļ�����
reg add HKCR\qylcfile\shell\open\command /ve /d "\"%qylc_path%\" \"%%1\"" /f

rem ��ӡ�����Ϣ
echo ע�����ӳɹ���

rem ȷ���û��Ƿ�Ҫ��qythou��ӵ�path
echo " "
echo ����Ҫ��qythou�����path���밴���������
echo ������ֱ�ӹرձ�����
pause>nul
echo " "
echo �������з��գ����ٴ�ȷ�Ϻ��������������
pause>nul

rem ��ȡ��ǰĿ¼������·��
set current_dir=%~dp0
rem ȥ��·��ĩβ�ķ�б��
set current_dir=%current_dir:~0,-1%
rem ��鵱ǰĿ¼�Ƿ��Ѿ���PATH��
echo %PATH% | findstr /C:"%current_dir%" >nul 2>&1
rem �������PATH�У���׷�ӵ�PATH��
if errorlevel 1 (
    setx PATH "%PATH%;%current_dir%"
    echo ��ǰĿ¼����ӵ��û���������PATH�С�
) else (
    echo ��ǰĿ¼�Ѿ����û���������PATH�С�
)
pause