# Veewee Definitions

## Getting Started


1. Symlink definitions in ```veewee/definitions/``` directory
	
	Example:

	```
ln -s /path/to/repo/veewee-definitions/CentOS-6.5-i386-tiny ./definitions/
	```

- Build a box using the definition name.

	Example:
	
	``` 
bundle exec vbox build 'CentOS-6.5-i386-tiny'
	```
	
- Export a box

	Example:

	```
bundle exec veewee vbox export 'CentOS-6.5-i386-tiny'
	```