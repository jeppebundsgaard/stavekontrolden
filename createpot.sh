#!/bin/bash
find . -name "*.php"  >POTFILES
xgettext --from-code=UTF-8  -p ./locale/ --files-from=POTFILES -o messages.pot *.php
rm POTFILES
find . -name "*.js" >JSPOTFILES
xgettext --from-code=UTF-8  -p ./locale/ --files-from=JSPOTFILES -o jsmessages.pot
rm JSPOTFILES
