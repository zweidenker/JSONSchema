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

{ #category : 'formatting' }
JSONFormatDate class >> formatName [
	^ #date
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
