Class {
	#name : 'JSONFormatDate',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'reading' }
JSONFormatDate class >> basicConvertString: aString [ 
	^ Date fromString: aString
]

{ #category : 'as yet unclassified' }
JSONFormatDate class >> encodeJSON: aDate [
	^ aDate yyyymmdd 
]

{ #category : 'validation' }
JSONFormatDate class >> daysInMonth: aMonth year: aYear [
	| leap |
	leap := (aYear \\ 4 = 0) and: [ (aYear \\ 100 ~= 0) or: [ aYear \\ 400 = 0 ] ].
	aMonth = 2 ifTrue: [ ^ leap ifTrue: [ 29 ] ifFalse: [ 28 ] ].
	^ #(31 28 31 30 31 30 31 31 30 31 30 31) at: aMonth
]

{ #category : 'formatting' }
JSONFormatDate class >> formatName [
	^ #date
]

{ #category : 'validation' }
JSONFormatDate class >> isValidFullDate: aString [
	"RFC 3339 full-date: YYYY-MM-DD with a real calendar day (month 1-12, day valid
	for the month incl. leap years). Rejects other ISO 8601 forms like ordinal dates."
	| year month day ok |
	ok := (aString size = 10) and: [ (aString at: 5) = $- and: [ (aString at: 8) = $- ] ].
	ok := ok and: [ (1 to: 4) allSatisfy: [ :i | (aString at: i) isDigit ] ].
	ok := ok and: [ ((aString at: 6) isDigit and: [ (aString at: 7) isDigit ]) and: [ (aString at: 9) isDigit and: [ (aString at: 10) isDigit ] ] ].
	ok ifFalse: [ ^ false ].
	year := (aString copyFrom: 1 to: 4) asInteger.
	month := (aString copyFrom: 6 to: 7) asInteger.
	day := (aString copyFrom: 9 to: 10) asInteger.
	^ (month between: 1 and: 12) and: [ day between: 1 and: (self daysInMonth: month year: year) ]
]

{ #category : 'validation' }
JSONFormatDate class >> validateString: aString [
	(self isValidFullDate: aString) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid date' ]
]

{ #category : 'services' }
JSONFormatDate class >> validate: aDate [
	(aDate isKindOf: Date) ifFalse: [ 
		JSONTypeError
			signal: aDate printString , ' is not a date' ]
	
]

{ #category : 'writing' }
JSONFormatDate class >> write: aDate [ 
	"convert to DateaAndTime without the sub-second precision"
	^ aDate yyyymmdd 
]
