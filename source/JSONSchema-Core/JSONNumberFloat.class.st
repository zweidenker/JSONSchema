Class {
	#name : 'JSONNumberFloat',
	#superclass : 'JSONNumberFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'formatting' }
JSONNumberFloat class >> formatName [ 
	^ #float
]

{ #category : 'testing' }
JSONNumberFloat class >> validateString: aString [

	| numberParts |
	numberParts := aString findTokens: (Array with: $.) escapedBy: #().
	numberParts size <= 2
		ifTrue: [ (numberParts
				allSatisfy:
					[ :eachSubstring | eachSubstring allSatisfy: [ :eachChar | eachChar isDigit ] ])
				ifTrue: [ ^ self ] ].
	^ JSONTypeError
		signal: aString printString , ' is not a valid double value'
]
