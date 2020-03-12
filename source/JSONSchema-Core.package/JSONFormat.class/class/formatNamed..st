instance creation
formatNamed: aString 
	^ (self allSubclasses reject: #isAbstract)
		detect: [ :each | each formatName = aString ]
		ifNone: [ JSONInvalidFormatName signal: 'cannot find format with name ', aString asString ]