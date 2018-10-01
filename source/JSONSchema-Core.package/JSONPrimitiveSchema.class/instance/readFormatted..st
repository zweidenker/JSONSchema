formatting
readFormatted: anObject
	^ format
		ifNotNil: [ format readType: anObject ]
		ifNil: [ anObject ]