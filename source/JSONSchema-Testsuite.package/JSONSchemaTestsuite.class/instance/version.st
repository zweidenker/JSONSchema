accessing
version
	^ version ifNil: [ version := self defaultVersion ]