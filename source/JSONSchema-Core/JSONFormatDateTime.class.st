Class {
	#name : 'JSONFormatDateTime',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'converting' }
JSONFormatDateTime class >> basicConvertString: aString [ 
	^ DateAndTime fromString: aString 
]

{ #category : 'as yet unclassified' }
JSONFormatDateTime class >> encodeJSON: aDateAndTime [
	^ aDateAndTime printString 
]

{ #category : 'formatting' }
JSONFormatDateTime class >> formatName [
	^ 'date-time'
]

{ #category : 'validation' }
JSONFormatDateTime class >> isValidDateTime: aString [
	"RFC 3339 date-time = full-date T full-time (T and the trailing Z are
	case-insensitive). Delegates to the date and time format validators."
	| ti datePart timePart |
	ti := (1 to: aString size) detect: [ :i | (aString at: i) = $T or: [ (aString at: i) = $t ] ] ifNone: [ 0 ].
	ti = 0 ifTrue: [ ^ false ].
	datePart := aString copyFrom: 1 to: ti - 1.
	timePart := aString copyFrom: ti + 1 to: aString size.
	^ (JSONFormatDate isValidFullDate: datePart) and: [ JSONFormatTime isValidString: timePart ]
]

{ #category : 'services' }
JSONFormatDateTime class >> validate: aDate [
	(aDate isKindOf: DateAndTime) ifFalse: [ 
		JSONTypeError
			signal: aDate printString , ' is not a date' ]
	
]

{ #category : 'validation' }
JSONFormatDateTime class >> validateString: aString [
	(self isValidDateTime: aString) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid date-time' ]
]

{ #category : 'writing' }
JSONFormatDateTime class >> write: aDateAndTime [ 
	"convert to DateaAndTime without the sub-second precision"
	^ aDateAndTime rounded printString
]
