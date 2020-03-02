services
validate: anObject

	| numberParts |
	numberParts := anObject findTokens: (Array with: $.) escapedBy: #().
	numberParts size <= 2
		ifTrue: [ (numberParts
				allSatisfy:
					[ :eachSubstring | eachSubstring allSatisfy: [ :eachChar | eachChar isDigit ] ])
				ifTrue: [ ^ self ] ].
	^ JSONTypeErrror
		signal: anObject printString , ' is not a valid double value'