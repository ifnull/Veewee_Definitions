# Veewee Definitions

1. Symlink definitions in ```veewee/definitions/``` directory
	```ln -s ./veewee-definitions/centos-6.4-slim ./veewee/definitions/
- Build a box using the definition name.  
	```veewee vbox build 'centos-6.4-slim'```
- Export a box  
	```bundle exec veewee vbox export 'centos-6.4-slim'```
