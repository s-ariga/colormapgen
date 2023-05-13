# Seiichi Ariga <seiichi.ariga@gmail.com>

###
# Move *.txt colormap files from original directory.
# 1. Copy every Color Maps directories into "../colormaps".
# 2. Run this script from this directory.

Move-Item -Path "..\colormaps\*\*.txt" -Destination "..\colormaps\"
