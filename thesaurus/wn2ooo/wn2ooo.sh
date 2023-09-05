#!/bin/sh

export WNHOME="/home/jeppe/www/stavekontrolden/thesaurus/DanNet-2.2_owl"
python2 wn2ooo.py >th_da_DK_new.dat
cat th_da_DK_new.dat | perl th_gen_idx.pl > th_da_DK_new.idx
