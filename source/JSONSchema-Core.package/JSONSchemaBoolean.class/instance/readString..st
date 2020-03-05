reading-primitive data
readString: aString
	(aString = 'true') ifTrue: [ 
		^ true ].
	(aString = 'false') ifTrue: [ 
		^ false ].
	^ JSONTypeError signal: 'not a boolean'
	