rem level blocks
for %%f in ("map16/*.unc") do tools\slz.exe "map16/%%f" "map16/%%~nf.bin"

rem level chunks
for %%f in ("map256/*.unc") do tools\slz.exe "map256/%%f" "map256/%%~nf.bin"

rem graphics
tools\TwizMod.exe "arttwim/titlefor.unc" "arttwim/titleson.unc" "arttwim/titletm.unc" "arttwim/segalogo.unc"
