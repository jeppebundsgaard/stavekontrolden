# Stavekontrolden
A frontend for creating and maintaing hunspell dictionaries.
Stavekontrolden is a tool intended to support the development of the Danish spell checker dictionary and affix-description file to be used with hunspell in programs like LibreOffice, Firefox and many more.

The system supports the creation of affix classes and affix rules and keeps track of how they are connected. In order to make tagging of words in the dictionary more convenient, it also introduces the concept of word classes, which are collections of affix classes. To the taggers, word classes and declensions of these are the only thing they have to care about. Further, in Danish and other language, word can be glued together using so-called Fuge Elements (in German) or fugeelementer (in Danish). This is also supported by Stavekontrolden.

You are welcome to add you language at https://stavekontrolden.dk. 

## Install
- Copy files to your server. 
- Change ./settings/conf.php and ./settings/.htdatabase.
- Create the database and tables from stavekontrolden.sql 
- Create an admin user and an organization manually
- Log in.
