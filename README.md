# Stavekontrolden
A frontend for creating and maintaing hunspell dictionaries.
Stavekontrolden is a tool intended to support the development of the Danish spell checker dictionary and affix-description file to be used with hunspell in programs like LibreOffice, Firefox and many more.

The system supports the creation of affix classes and affix rules and keeps track of how they are connected. In order to make tagging of words in the dictionary more convenient, it also introduces the concept of word classes, which are collections of affix classes. To the taggers, word classes and declensions of these are the only thing they have to care about. Further, in Danish and other language, word can be glued together using so-called Fuge Elements (in German) or fugeelementer (in Danish). This is also supported by Stavekontrolden.

You are welcome to add your language at https://stavekontrolden.dk. 

## Install
- Copy files to your server. 
- Change ./settings/conf.php and ./settings/.htdatabase.
- Create the database and tables from stavekontrolden.sql 
- Create an admin user and an organization manually
- Log in.

## Share your spell checker with the world

### OpenOffice, Libreoffice and more

Many open source programs take their spellchecker from Apache OpenOffice, so make sure to upload your dictionary at their extension site, e.g.: https://extensions.openoffice.org/en/project/danish-spellcheck-and-hyphenation-dictionaries. Create a user and upload the .oxt-file.

LibreOffice: Create a user at https://extensions.libreoffice.org/admin/extensions/LibreOffice-Extensions-Extension, and upload the .oxt-file.

To get your spellchecker packed with the next LibreOffice release, write an e-mail to Andras Timar andras.timar at collabora dot com with a link to the latest release, e.g. https://stavekontrolden.dk/dictionaries/da_DK/da_DK-2.8.001.oxt.

### Firefox and Thunderbird

Firefox and Thunderbird uses the .xpi-file packed when creating the dictionary. Upload as an extension both places, e.g. https://addons.thunderbird.net/da/developers/addon/dansk-ordbog/ and https://addons.mozilla.org/da/developers/addon/dansk-ordbog/
