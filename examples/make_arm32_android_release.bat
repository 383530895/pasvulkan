@echo off 
SET PATH=c:\FPC\3.1.1\bin\i386-win32\
SET nodosfilewarning=1
del *.a
del *.ppu
del *.o
del .\..\src\*.a
del .\..\src\*.ppu
del .\..\src\*.o
del libmain.so 
del libSDL2.so
del "android\\app\\src\\main\\jniLibs\\armeabi-v7a\\libmain.so"
del libmain.so
copy .\..\libs\sdl20androidarm32\libSDL2.so libSDL2.so
copy .\..\libs\libpngandroid\obj\local\armeabi-v7a\libpng.a libpng.a
"c:\FPC\3.1.1\bin\i386-win32\ppcrossarm.exe" -Tandroid -Sd -B -CpARMv7A -CfVFPv3 -OpARMv7a -OoFastMath -O1 -XX -Xs -CX -Cg "-olibmain.so" -dRELEASE -dPasVulkanPasMP -dPasVulkanUseSDL2 examples.dpr
copy libmain.so "android\\app\\src\\main\\jniLibs\\armeabi-v7a\\libmain.so"
del libpng.a
del *.a
del *.ppu
del *.o
del .\..\src\*.a
del .\..\src\*.ppu
del .\..\src\*.o
del libSDL2.so