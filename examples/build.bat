@echo off

:restart

for /d %%D in ("*") do (
    echo %%~nxD
)
echo:

set /p dir=Choose an exemple: 
cls

cd %dir%

if not exist build.hxml (
    (
    echo -cp source
    echo -D analyzer-optimize
    echo -main Main
    echo --library hxgemini-api
    echo --interp
    )>build.hxml
)

echo Output:
echo:
haxe build.hxml
echo:

pause