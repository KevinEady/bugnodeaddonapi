Remove-Item build\test.node, build\main.o -ErrorAction Ignore

$NodeVersion   = "20.8.0" # updating this needs updating libtest-windows.yml
$NodeIncFolder = "$env:USERPROFILE\.cmake-js\node-x64\v$NodeVersion\include\node"

$cxx = 'clang++.exe'

if (Test-Path -Path $NodeIncFolder) {
    & $cxx -c -I"$NodeIncFolder" -O2 -fexceptions -fno-omit-frame-pointer -fno-rtti -o build\main.o main.cc
    & $cxx -shared -v -o build\test-clang++.node "$env:USERPROFILE\.cmake-js\node-x64\v$NodeVersion\win-x64\node.lib" build\main.o
} else {
    Write-Error "$NodeIncFolder does not exist; please run cmake build first"
    $host.SetShouldExit(1)
    exit
}
