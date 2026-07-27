Class {
	#name : 'JSONFormatIRIReference',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'reading' }
JSONFormatIRIReference class >> basicConvertString: aString [
	^ aString
]

{ #category : 'reading' }
JSONFormatIRIReference class >> encodeJSON: aString [
	^ aString
]

{ #category : 'accessing' }
JSONFormatIRIReference class >> formatName [
	^ 'iri-reference'
]

{ #category : 'validation' }
JSONFormatIRIReference class >> isValidString: aString [
	"An IRI reference is any sequence of legal IRI characters - the RFC 3986 repertoire
	plus non-ASCII ucschar. Notably rejects backslashes, spaces and other controls."
	| legal |
	legal := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~:/?#[]@!$&''()*+,;=%'.
	^ aString allSatisfy: [ :c | (legal includes: c) or: [ c asInteger > 127 ] ]
]

{ #category : 'validation' }
JSONFormatIRIReference class >> validateString: aString [
	(self isValidString: aString) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid iri-reference' ]
]
