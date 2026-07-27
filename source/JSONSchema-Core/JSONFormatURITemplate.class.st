Class {
	#name : 'JSONFormatURITemplate',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'reading' }
JSONFormatURITemplate class >> basicConvertString: aString [
	^ aString
]

{ #category : 'reading' }
JSONFormatURITemplate class >> encodeJSON: aString [
	^ aString
]

{ #category : 'accessing' }
JSONFormatURITemplate class >> formatName [
	^ 'uri-template'
]

{ #category : 'validation' }
JSONFormatURITemplate class >> isValidString: aString [
	"RFC 6570 expressions are delimited by { and }. A necessary well-formedness check:
	braces must be balanced and non-nested (every { closed by a } before the next {)."
	| inside |
	inside := false.
	aString do: [ :c |
		c = ${ ifTrue: [ inside ifTrue: [ ^ false ]. inside := true ]
		ifFalse: [ c = $} ifTrue: [ inside ifFalse: [ ^ false ]. inside := false ] ] ].
	^ inside not
]

{ #category : 'validation' }
JSONFormatURITemplate class >> validateString: aString [
	(self isValidString: aString) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid uri-template' ]
]
