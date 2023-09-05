
ABOUT THE FORMAT
================
The DanNet_owl resource is supplied in an extension of the W3C's
representation of wordnets (draft), cf. http://www.w3.org/TR/wordnet-rdf/
for more information about the format.

Information that is not described in the W3C specifications (ie.
DanNet specific information) is marked by the namespace 
'http://www.wordnet.dk/owl/nnnn/nn/schema'. The namespace for 
the lexical resource itself is 'http://www.wordnet.dk/owl/nnnn/nn/instances'.


FILES
=====
Meta files
----------
README.txt  This file.
LICENSE.txt The license that the user must accept when using DanNet.
RELEASE_NOTES.txt Changes in this release.

Synsets
-------
synsets.rdf    : The synsets are declared in this file.
glossary.rdf   : The gloss of each synset.
words.rdf      : Words and their lexical form.
wordsenses.rdf : Connects synsets and words.

dummies.rdf    : Synsets that are included without much information.
                 They are included because they are targets
                 of relations describing other synsets, but have
                 no relations of their own. For DanNet_owl_demo
                 this may result from relations that target synsets
                 outside the domain of the export.

synset_attributes.rdf : 'Attributes' that describe the synset
                        further (at the moment:'connotation' ('positive' 
                        or 'negative') and 'sex' ('male' or 'female')).

register.rdf    : Information about the register of the word senses,
                  e.g. 'slang' or 'sj.' (i.e. 'old-fashioned').

Relations
---------
The various 'relations' that links synsets to eachother, are supplied
in separate files, one file for each relation type. For a description
of the semantics of the relation please consult the linguistic 
specifications for DanNet. The most important files are:

hyponymOf.rdf    : Relation that link a synset to its immediate
                   hypernym.

eqSynonymOf.rdf,
eqHyponymOf.rdf,
eqHypernymOf.rdf : Relations that link synsets from the DanNet resource
                   to synsets from the Princeton Wordnet (v. 2.0). The
                   synsets selected are so-called Base Concepts from
                   Global Wordnet Association (cf. http://globalwordnet.org).
                   5,000 synsets will be linked to the Princeton Wordnet,
                   but only a few hundred links exist at present time,
                   and they are not yet validated.
                   The files include also the declaration for the
                   (abbreviated) target synset. The Princeton Wordnet
                   resource is not included, as a separate license
                   exists for this resource. The Princeton Wordnet
                   may be obtained from http://wordnet.princeton.edu.

hypernymOf_taxonomic.rdf : This file includes information each hyponymOf
                           relation and whether it is taxonomic or
                           non-taxonomic.

Note that a relation may be negated. A negation is declared the
<owl:NegativeObjectPropertyAssertion/> construct.

The owl/rdf language
--------------------
w3c_wordnet_spec.rdfs : The W3C specifications for wordnets
dn_full_spec.rdfs     : The specifications for the part of 
                        DanNet_owl that extends W3C.
                        This file imports the W3C specifications.

Inheritance
-----------
Synsets inherits relations from it hypernyms. In the DanNet_owl
resource all inherited relations are computed for each synset.
Inherited relations are marked as such by xml comments in the
rdf files.

Owl/rdf reasoners may be set up to compute the inherited relations
using the hyponymOf relation as axis, but this version of the
DanNet_owl resource does not include information about which
inherited relations should restricted to a more specific target, and
which inherited relations should be blocked altogether. An
owl/rdf reasoner will therefore generate to many inherited relations.

Reverse relations
-----------------
Note that many relations are defined as the 'reverse' of some other 
relation, according to the specifications (.rdfs files). For instance
is 'hypernymOf' the reverse relation of 'hyponymOf', and 'holonymOf' 
is the reverse of 'meronymOf'. In these files only relations
that are significant to a synset is supplied. E.g. it is significant
for 'birch' that it is a hyponym of 'tree'. But it is not significant
of 'tree' that there may or may not exist such a thing as a 'birch'. 
Therefore the synset describing 'birch' includeds 'hyponymOf tree',
but the synset describing 'tree' does not include 'hypernymOf birch'.

It is for the user or application to decide whether the reverse
relation information should be computed an utilized. (Owl/rdf
reasoners should do this automatically.)

PR0TÉGÉ AS VIEWER
=================
Installation
-----------------
It is possible to navigate the DanNet_owl_demo resource in the 
Protégé 4.0beta software. For most computer configurations, however,
the entire DanNet_owl resource will be too large.

Note that the owl format is an instance model and it is NOT
immediately possible to view the resource as a tree
structure (hypernymy hierarchy).

Protégé 4.0 is developed at Stanford University and is
available from their web site (http://...). Registration is
necessary.

When Protégé 4.0 is installed, the DanNet may loaded by selecting 
"..." from the startup screen, and from the DanNet_owl_demo
folder choosing either the DanNet_full.owl file, which contains all
information from DanNet, or the DanNet_wc3.owl file, which 
contains only the part of the resource that is described in the
W3C specifications for wordnets.

Setting up Protégé
------------------
Protégé 4.0 may be set up to show 'labels' (e.g. '{jeep_1}'),
instead of ids of synsets (e.g. 'synset-1507') when navigating
the resource:

  a. Choose File -> Preferences -> Renderer
  b. Select "Render entities using annotation values"
  c. Choose "OK"

Navigation
----------
In Protégé the resource is divided into several tabs in the top of 
the screen. The most important ones are: Active ontology, Classes, 
and Individuals.

Selecting the "Active ontology" tab will display the release notes 
for this particular version of the DanNet resource.

Selecting the "Classes" tab will show the owl/rdf language used to
describe the wordnet, e.g. the specifications for 'synsets' and
'words'.

DanNet_owl is an instance model, and the lexical resource itself
is viewable by selecting the "Individuals" tab. Note that all
instances (individuals) are listed here, i.e. synset instances
as well as wordsense instances and word instances.

It is the synset instances we are interested in here. They will
be listed by names enclosed by '{}', e.g. '{ord_1}' or
'{automobil_1, bil_1, spand_2}', in the left part of the screen 
(if Protégé is set up as suggested above).

By selecting a synset we are able to investigate the information
for this particular synset, including its relations to other
synsets in DanNet, in the right part of the screen.

All synsets (except dummy and Princeton Wordnet (English) synsets) 
will have a 'hyponymOf' relation linking the synset to the immediate 
hypernym. By carefully clicking the name of the target synset the 
information for this synset will be shown.

