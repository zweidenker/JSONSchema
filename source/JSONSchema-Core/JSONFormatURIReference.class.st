Class {
	#name : 'JSONFormatURIReference',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'reading' }
JSONFormatURIReference class >> basicConvertString: aString [
	^ aString
]

{ #category : 'reading' }
JSONFormatURIReference class >> encodeJSON: aString [
	^ aString
]

{ #category : 'accessing' }
JSONFormatURIReference class >> formatName [
	^ 'uri-reference'
]

{ #category : 'validation' }
JSONFormatURIReference class >> isValidString: aString [
	"A necessary URI-reference check (RFC 3986): every character must be a legal URI
	character - unreserved, reserved (gen/sub-delims) or the percent-escape marker.
	This rejects e.g. backslashes and spaces while accepting absolute and relative refs."
	| allowed |
	allowed := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-._~:/?#[]@!$&''()*+,;=%'.
	^ aString allSatisfy: [ :c | allowed includes: c ]
]

{ #category : 'validation' }
JSONFormatURIReference class >> validateString: aString [
	(self isValidString: aString) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid uri-reference' ]
]
