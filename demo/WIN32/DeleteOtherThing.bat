@echo off
::********************** 注释 ************************
::列出当前目录和子目录中包含“Debug”的文件夹，然后删除。
::dir /s /b /a:d 用于列举当前目录和子目录。（/s 也列举子目录，/b 隐藏标题信息或摘要，/a 只列出指定属性的文件，d表示文件夹。）
::findstr /i "\\Debug$" 在列出的目录中找出匹配“\Debug”的文件夹，（/i 不区分大小写）
::for /f "usebackq tokens=1* delims=/" %%a in ...do remdir /s /q %%a 删除所找到的文件夹。(/s 删除子目录,/q 不需要确认）
::******************************************************
::cd
for /f "usebackq tokens=1* delims=/" %%a in (`dir /s /b /a:d ^| findstr /i "\\Debug$"`) do rmdir /s /q "%%a"
for /f "usebackq tokens=1* delims=/" %%a in (`dir /s /b /a:a ^| findstr /i "\\*.vcproj.*.user$"`) do del /s /q "%%a"
for /f "usebackq tokens=1* delims=/" %%a in (`dir /s /b /a:a ^| findstr /i "\\*.aps$"`) do del /s /q "%%a"
for /f "usebackq tokens=1* delims=/" %%a in (`dir /s /b /a:a ^| findstr /i "\\*.suo$"`) do del /s /q "%%a"
for /f "usebackq tokens=1* delims=/" %%a in (`dir /s /b /a:a ^| findstr /i "\\*.ncb$"`) do del /s /q "%%a"
for /f "usebackq tokens=1* delims=/" %%a in (`dir /s /b /a:a ^| findstr /i "\\*.sln$"`) do del /s /q "%%a"