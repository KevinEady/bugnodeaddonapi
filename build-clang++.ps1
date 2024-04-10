Remove-Item build\test.node, build\main.o -ErrorAction Ignore

$NodeVersion   = "20.8.0" # updating this needs updating libtest-windows.yml
$NodeIncFolder = "$env:USERPROFILE\.cmake-js\node-x64\v$NodeVersion\include\node"

if (Test-Path -Path $NodeIncFolder) {
    & 'C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\Llvm\x64\bin\clang++.exe' -c -I"$NodeIncFolder" -O2 -fexceptions -fno-omit-frame-pointer -fno-rtti -o build\main.o main.cc
    & 'C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Tools\Llvm\x64\bin\clang++.exe' -shared -v -o build\test-clang++.node "$env:USERPROFILE\.cmake-js\node-x64\v$NodeVersion\win-x64\node.lib" build\main.o
} else {
    Write-Error "$NodeIncFolder does not exist; please run cmake build first"
    $host.SetShouldExit(1)
    exit
}
