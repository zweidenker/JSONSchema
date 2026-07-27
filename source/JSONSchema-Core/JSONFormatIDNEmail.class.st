Class {
	#name : 'JSONFormatIDNEmail',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'reading' }
JSONFormatIDNEmail class >> basicConvertString: aString [
	^ aString
]

{ #category : 'reading' }
JSONFormatIDNEmail class >> encodeJSON: aString [
	^ aString
]

{ #category : 'accessing' }
JSONFormatIDNEmail class >> formatName [
	^ 'idn-email'
]

{ #category : 'validation' }
JSONFormatIDNEmail class >> isValidString: aString [
	"A dot-atom (Unicode-tolerant) local part followed by @ and an IDN hostname domain."
	| at local domain atext |
	at := aString lastIndexOf: $@.
	at = 0 ifTrue: [ ^ false ].
	local := aString copyFrom: 1 to: at - 1.
	domain := aString copyFrom: at + 1 to: aString size.
	atext := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!#$%&''*+-/=?^_`{|}~.'.
	(local notEmpty and: [ local first ~= $. and: [ local last ~= $. and: [ (local includesSubstring: '..') not and: [ local allSatisfy: [ :ch | (atext includes: ch) or: [ ch asInteger >= 128 ] ] ] ] ] ])
		ifFalse: [ ^ false ].
	^ JSONFormatIDNHostname isValidString: domain
]

{ #category : 'validation' }
JSONFormatIDNEmail class >> validateString: aString [
	(self isValidString: aString) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid idn-email' ]
]
