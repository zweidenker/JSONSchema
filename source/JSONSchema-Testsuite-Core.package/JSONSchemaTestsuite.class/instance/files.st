accessing
files
	^ files ifNil: [ files := self createFiles ]