#! /bin/bash


# Teal format, or no teal format

TEAL="-T"
#TEAL="";

FILTER='s/\#item_+//gi; s/NAME=\"item_//gi;'

for x in *.pod;
    do
       # input: foo.pod, output: foo.pod.html
      <$x pod2html 2>/dev/null | perl -pe '$FILTER' > $x.html;
       # input: foo.pod.html, output: foo.html.pdb
      htmltodoc $TEAL $x.html ;
      rm $x.html;
      OUT=`echo $x | perl -pe 's/.pod//; '`
      mv $x.pdb $OUT.pdb
    done
