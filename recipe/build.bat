@echo on

md %LIBRARY_PREFIX%\share\playwright
pushd %LIBRARY_PREFIX%\share\playwright
md node_modules
cmd /c "npm install playwright@%PKG_VERSION%"
if errorlevel 1 exit 1
popd

pushd %LIBRARY_PREFIX%\bin
for %%c in (playwright) do (
  echo @echo off >> %%c.bat
  echo "%LIBRARY_PREFIX%\share\playwright\node_modules\.bin\%%c.cmd" %%* >> %%c.bat
)
popd
