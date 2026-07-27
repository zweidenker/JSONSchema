Class {
	#name : 'JSONFormatRelativeJSONPointer',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'reading' }
JSONFormatRelativeJSONPointer class >> basicConvertString: aString [
	^ aString
]

{ #category : 'reading' }
JSONFormatRelativeJSONPointer class >> encodeJSON: aString [
	^ aString
]

{ #category : 'accessing' }
JSONFormatRelativeJSONPointer class >> formatName [
	^ 'relative-json-pointer'
]

{ #category : 'validation' }
JSONFormatRelativeJSONPointer class >> isValidString: aString [
	"A non-negative integer prefix (no leading zeros) followed by either # or a JSON
	Pointer (RFC 6901). The prefix counts how many levels to ascend."
	| idx intPart rest |
	(aString isEmpty or: [ aString first isDigit not ]) ifTrue: [ ^ false ].
	idx := 1.
	[ idx <= aString size and: [ (aString at: idx) isDigit ] ] whileTrue: [ idx := idx + 1 ].
	intPart := aString copyFrom: 1 to: idx - 1.
	(intPart size > 1 and: [ intPart first = $0 ]) ifTrue: [ ^ false ].
	rest := aString copyFrom: idx to: aString size.
	rest isEmpty ifTrue: [ ^ true ].
	rest = '#' ifTrue: [ ^ true ].
	^ JSONFormatJSONPointer isValidString: rest
]

{ #category : 'validation' }
JSONFormatRelativeJSONPointer class >> validateString: aString [
	(self isValidString: aString) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid relative-json-pointer' ]
]
