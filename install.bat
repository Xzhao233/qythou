@echo off
rem 这是一个用批处理写的示例代码

rem 获取当前目录下的qythou.exe的完整路径
set qythou_path=%cd%\qythou.exe

rem 在注册表中创建.qy文件类型的键，并设置默认值为qythoufile
reg add HKCR\.qy /ve /d qythoufile /f

rem 在注册表中创建qythoufile键，并设置默认图标为qythou.exe的图标
reg add HKCR\qythoufile /ve /d "qythou 源代码文件" /f
reg add HKCR\qythoufile\DefaultIcon /ve /d "%qythou_path%,0" /f

rem 在qythoufile键下创建shell\open\command键，并设置默认值为qythou.exe加上文件参数
reg add HKCR\qythoufile\shell\open\command /ve /d "\"%qythou_path%\" \"%%1\"" /f

rem 打印完成信息
echo 注册表添加成功！

rem 确认用户是否要将qythou添加到path
echo " "
echo 如你要将qythou添加至path，请按任意键继续
echo 否则，请直接关闭本窗口
pause>nul
echo " "
echo 本操作有风险，请再次确认后按任意键继续继续
pause>nul

rem 获取当前目录的完整路径
set current_dir=%~dp0
rem 去掉路径末尾的反斜杠
set current_dir=%current_dir:~0,-1%
rem 检查当前目录是否已经在PATH中
echo %PATH% | findstr /C:"%current_dir%" >nul 2>&1
rem 如果不在PATH中，就追加到PATH中
if errorlevel 1 (
    setx PATH "%PATH%;%current_dir%"
    echo 当前目录已添加到用户环境变量PATH中。
) else (
    echo 当前目录已经在用户环境变量PATH中。
)
pause
