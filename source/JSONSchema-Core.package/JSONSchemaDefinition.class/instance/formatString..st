accessing
formatString: aString 
	(aString = 'string') ifTrue: [ ^ self ].
	format := JSONFormat formatNamed: aString