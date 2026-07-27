Class {
	#name : 'JSONFormatEmail',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'reading' }
JSONFormatEmail class >> basicConvertString: aString [
	^ aString
]

{ #category : 'as yet unclassified' }
JSONFormatEmail class >> encodeJSON: aString [
	^ aString
]

{ #category : 'accessing' }
JSONFormatEmail class >> formatName [
	^ 'email'
]

{ #category : 'validation' }
JSONFormatEmail class >> isValidString: aString [
	"A dot-atom local part (RFC 5321 atext, no leading/trailing/consecutive dots)
	followed by @ and a hostname domain."
	| at local domain atext |
	at := aString lastIndexOf: $@.
	at = 0 ifTrue: [ ^ false ].
	local := aString copyFrom: 1 to: at - 1.
	domain := aString copyFrom: at + 1 to: aString size.
	atext := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%&''*+-/=?^_`{|}~.'.
	(local notEmpty and: [ local first ~= $. and: [ local last ~= $. and: [ (local includesSubstring: '..') not and: [ local allSatisfy: [ :c | atext includes: c ] ] ] ] ])
		ifFalse: [ ^ false ].
	^ JSONFormatHostname isValidString: domain
]

{ #category : 'validation' }
JSONFormatEmail class >> validateString: aString [
	(self isValidString: aString) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid email address' ]
]
