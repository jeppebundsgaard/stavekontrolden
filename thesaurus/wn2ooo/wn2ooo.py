#!/usr/bin/python
# wn2ooo.py, Daniel Naber, 2005-07-23
# A simple Python script to create an OpenOffice.org (>=2.0) thesaurus
# from the data in WordNet (http://wordnet.princeton.edu/)
# This generates the .dat file, the th_gen_idx.pl script is needed
# to then build the .idx file.

# Changes compared to Kevin's export:
# -generic terms are marked as such
# -antonyms are now included and marked as such
# -removed a superfluous space at the end of some lines
# -Removed broken lines like "(adj)|  ", i.e. lines that contain only whitespace
#	instead of synonyms
# -Don't list synonyms that are identical to the originally searched word
# -".22" doesn't list the synonyms for "22"

# -TODO: "younger" has less synonyms than "young" (similar for other full forms)
# -TODO: "hasidim" has one sense here, but 2 senses in WordNet online
# -TODO: ".22 calibre" is known, ".22 caliber" is not -- why?
# -TODO: 'hood is missing -- problem with the WordNet API?

# Changes:
# 2005-04-10 -> 2005-07-23:
#  -fixed a bug that printed empty "realted terms"
#  -work with WordNet 2.1 now (manually copy the WordNet 2.0 dict/lexnames file to Wordnet 2.1)

from wordnet import *
import sys

GENERIC_TERM_STR = '(generic term)'
SIMILAR_TERM_STR = '(similar term)'
ALSO_SEE_TERM_STR = '(related term)'
PERTAINYM_STR = '(related term)'
ANTONYM_STR = '(antonym)'

#to create better diffs against the original files:
#GENERIC_TERM_STR = ''
#SIMILAR_TERM_STR = ''
#ALSO_SEE_TERM_STR = ''
#PERTAINYM_STR = ''
#ANTONYM_STR = '(antonym)'

def getRelatedTerms(sense, typ, display):
	upper_synsets = sense.synset.getPointerTargets(typ)
	l = []
	# There can be more than one hypernym, eg. for "goaltender":
	for upper_synset in upper_synsets:
		for u in upper_synset.getSenses():
			if display != '':
				l.append("%s %s" % (u.form, display))
			else:
				l.append(u.form)
	return str.join("|", l)

def getPertains(sense, display):
	upper_synsets = sense.synset.getPointerTargets(PERTAINYM)
	l = []
	for upper_synset in upper_synsets:
		for u in upper_synset.getSenses():
			entry = ''
			relTerms = getRelatedTerms(u, HYPERNYM, '')
			if display != '' and relTerms != "":
				entry = "%s %s" % (relTerms, display)
			else:
				entry = getRelatedTerms(u, HYPERNYM, '')
			try:
				listpos = l.index(entry)
			except ValueError, e:
				l.append(entry)
	return str.join("|", l)
	
def printSynsForWords(words):
	c = 0
	for word in words:
		l = []
		if c % 100 == 0:
			print >> sys.stderr, "Working on word %d" % c
		for pos in [ADJ, N, V, ADV]:
			try:
				for s in pos[word].getSenses():
					l.append(s)
			except KeyError, e:
				#print >> sys.stderr, e
				continue
		syn_count = 0
		syn_lines = ""
		for i in range(len(l)):
			sense = l[i]
			syn_synsets = sense.synset.getSenses()
			synset = ""
			syns_list = []
			for s in syn_synsets:
				if s.form != word:
					syns_list.append(s.form)
			more_general_terms = getRelatedTerms(sense, HYPERNYM, GENERIC_TERM_STR)
			similar_terms = getRelatedTerms(sense, SIMILAR, SIMILAR_TERM_STR)
			also_see_terms = getRelatedTerms(sense, ALSO_SEE, ALSO_SEE_TERM_STR)
			antonym_terms = getRelatedTerms(sense, ANTONYM, ANTONYM_STR)
			pertainym_terms = getPertains(sense, PERTAINYM_STR)
			pos_str = sense.synset.pos
			if pos_str == "adjective":
				pos_str = "adj"
			elif pos_str == "adverb":
				pos_str = "adv"
			if len(syns_list) > 0 or len(more_general_terms) > 0 or len(similar_terms) > 0 \
					or len(also_see_terms) > 0 or len(pertainym_terms) > 0 or len(antonym_terms) > 0:
				if len(syn_lines) == 0:
					br = ""
				else:
					br = "\n"
				synset = str.join("|", syns_list)
				syn_lines = "%s%s(%s)|%s" % (syn_lines, br, pos_str, synset)
				l_temp = [more_general_terms, similar_terms, also_see_terms, pertainym_terms, antonym_terms]
				more_generic_terms = myjoin("|", l_temp)
				if len(more_generic_terms) > 0:
					if len(synset) > 0:
						syn_lines = "%s|" % syn_lines
					syn_lines = "%s%s" % (syn_lines, more_generic_terms)
				syn_count = syn_count + 1
		if syn_count > 0:
			print "%s|%d\n%s" % (word, syn_count, syn_lines)
		c = c + 1
	return

# like str.join(), but ignores empty list elements:
def myjoin(sep, l):
	s = ""
	for elem in l:
		if s != '' and elem != '':
			s = "%s%s" % (s, sep)
		s = "%s%s" % (s, elem)
	return s

def main():
	print "ISO8859-1"

	words = {}
	dic = Dictionary(ADJECTIVE, "adj")
	for w in dic.keys():
		words[w] = None

	dic = Dictionary(NOUN, "noun")
	for w in dic.keys():
		words[w] = None
	
	dic = Dictionary(VERB, "verb")
	for w in dic.keys():
		words[w] = None

	dic = Dictionary(ADVERB, "adv")
	for w in dic.keys():
		words[w] = None

	words = words.keys()
	# tests:
	#words = ['dog', 'house', 'nullipara']
	#words = ['absent', 'whistle stop']
	#words = ['war']
	print >>sys.stderr, "Dictionaries contain %d words" % len(words)
	print >>sys.stderr, "Sorting..."
	words.sort(mycompare)
	printSynsForWords(words)
	return

def mycompare(a, b):
	# stupid hack to make sure the list is sorted like Kevin's original list:
	a = a.replace(" ", "Z")
	b = b.replace(" ", "Z")
	return cmp(a, b)

main()
