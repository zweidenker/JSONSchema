Class {
	#name : 'JSONFormatJSONPointer',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'reading' }
JSONFormatJSONPointer class >> basicConvertString: aString [
	^ aString
]

{ #category : 'reading' }
JSONFormatJSONPointer class >> encodeJSON: aString [
	^ aString
]

{ #category : 'accessing' }
JSONFormatJSONPointer class >> formatName [
	^ 'json-pointer'
]

{ #category : 'validation' }
JSONFormatJSONPointer class >> isValidString: aString [
	"RFC 6901: a JSON Pointer is either empty or a sequence of /-prefixed reference
	tokens; within a token ~ must be followed by 0 (escapes ~) or 1 (escapes /)."
	aString isEmpty ifTrue: [ ^ true ].
	aString first = $/ ifFalse: [ ^ false ].
	1 to: aString size do: [ :i |
		(aString at: i) = $~ ifTrue: [
			i = aString size ifTrue: [ ^ false ].
			((aString at: i + 1) = $0 or: [ (aString at: i + 1) = $1 ]) ifFalse: [ ^ false ] ] ].
	^ true
]

{ #category : 'validation' }
JSONFormatJSONPointer class >> validateString: aString [
	(self isValidString: aString) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid json-pointer' ]
]
