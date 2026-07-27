Class {
	#name : 'JSONFormatIRI',
	#superclass : 'JSONFormatURI',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'accessing' }
JSONFormatIRI class >> formatName [
	^ 'iri'
]

{ #category : 'validation' }
JSONFormatIRI class >> validateString: aString [
	(self isValidURIString: aString allowUnicode: true) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid iri' ]
]
