formatting
readFormatted: anObject
	^ format
		ifNotNil: [ format read: anObject ]
		ifNil: [ anObject ]