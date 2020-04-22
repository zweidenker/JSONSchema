services
validateString: aString
	| numberParts absolute |
	absolute := aString trim.
	(absolute beginsWith: '-')
		ifTrue: [ absolute := absolute allButFirst ].
	numberParts := absolute findTokens: (Array with: $.) escapedBy: #().
	numberParts size <= 2
		ifTrue: [ (numberParts
				allSatisfy:
					[ :eachSubstring | eachSubstring allSatisfy: [ :eachChar | eachChar isDigit ] ])
				ifTrue: [ ^ self ] ].
	^ JSONTypeError
		signal: aString printString , ' is not a valid double value'