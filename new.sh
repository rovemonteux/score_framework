#1/bin/sh
cp src/templates/template.lua $1.lua
sed -i -- "s/template/$1/g" $1.lua
