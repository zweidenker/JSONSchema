as yet unclassified
write: anObject
	^ format 
		ifNotNil: [ format write: anObject ]
		ifNil: [ anObject ]