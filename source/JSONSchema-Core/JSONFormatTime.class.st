Class {
	#name : 'JSONFormatTime',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'reading' }
JSONFormatTime class >> basicConvertString: aString [
	^ aString
]

{ #category : 'reading' }
JSONFormatTime class >> encodeJSON: aString [
	^ aString
]

{ #category : 'accessing' }
JSONFormatTime class >> formatName [
	^ 'time'
]

{ #category : 'validation' }
JSONFormatTime class >> isValidString: aString [
	"RFC 3339 full-time: HH:MM:SS with an optional fractional second and a required
	offset (Z or +/-HH:MM). Hours 0-23, minutes 0-59, seconds 0-60 (leap second)."
	| idx |
	aString size < 9 ifTrue: [ ^ false ].
	((self twoDigitsIn: aString at: 1 max: 23) and: [ (aString at: 3) = $: ]) ifFalse: [ ^ false ].
	((self twoDigitsIn: aString at: 4 max: 59) and: [ (aString at: 6) = $: ]) ifFalse: [ ^ false ].
	(self twoDigitsIn: aString at: 7 max: 60) ifFalse: [ ^ false ].
	idx := 9.
	(idx <= aString size and: [ (aString at: idx) = $. ]) ifTrue: [
		idx := idx + 1.
		(idx <= aString size and: [ (aString at: idx) isDigit ]) ifFalse: [ ^ false ].
		[ idx <= aString size and: [ (aString at: idx) isDigit ] ] whileTrue: [ idx := idx + 1 ] ].
	idx > aString size ifTrue: [ ^ false ].
	((aString at: idx) = $Z or: [ (aString at: idx) = $z ]) ifTrue: [ ^ idx = aString size ].
	(((aString at: idx) = $+ or: [ (aString at: idx) = $- ]) and: [ (aString size - idx) = 5 ])
		ifFalse: [ ^ false ].
	^ (self twoDigitsIn: aString at: idx + 1 max: 23)
		and: [ (aString at: idx + 3) = $: and: [ self twoDigitsIn: aString at: idx + 4 max: 59 ] ]
]

{ #category : 'validation' }
JSONFormatTime class >> twoDigitsIn: aString at: i max: aMax [
	"True if the two characters at i..i+1 are digits forming a value in 0..aMax."
	^ ((i + 1) <= aString size
		and: [ (aString at: i) isDigit and: [ (aString at: i + 1) isDigit ] ])
		and: [ (aString copyFrom: i to: i + 1) asInteger <= aMax ]
]

{ #category : 'validation' }
JSONFormatTime class >> validateString: aString [
	(self isValidString: aString) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid time' ]
]
