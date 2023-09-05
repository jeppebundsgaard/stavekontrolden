wn2ooo.py, 2005-07-23
Daniel Naber (http://www.danielnaber.de)

A simple Python script to create an OpenOffice.org (>=2.0) thesaurus
from the data in WordNet (http://wordnet.princeton.edu/)
Based on PyWordNet (http://osteele.com/projects/pywordnet/)

Requirements:
	WordNet 2.0 or 2.1 (older versions might work, too)

Usage:
  -Set WNHOME in wn2ooo.sh
  -if using WordNet 2.1, WordNet 2.0's dict/lexnames files needs to be 
   copied manually to your WordNet 2.1 "dict" directoy
  -Call wn2ooo.sh
  -Copy th_en_US_new.dat and th_en_US_new.idx to <OOo>/share/dict/ooo
  -restart OOo
