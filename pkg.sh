#!/bin/bash
name=org2nikola
version=0.2.1
pkg=$name-$version
mkdir $pkg
cp README.org $pkg
cp *.el $pkg
cat << EOF > $pkg/$name-pkg.el
(define-package "$name" "$version" "Conver Org to HTML for static blog generator Nikola")
EOF

if [[ `uname -s` == *Darwin* ]]; then
   COPYFILE_DISABLE="" tar cvf $pkg.tar $pkg/
else
   tar cvf $pkg.tar $pkg/
fi
rm -rf $pkg/
