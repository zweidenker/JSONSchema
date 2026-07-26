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

{ #category : 'services' }
JSONFormatDateTime class >> validate: aDate [
	(aDate isKindOf: DateAndTime) ifFalse: [ 
		JSONTypeError
			signal: aDate printString , ' is not a date' ]
	
]

{ #category : 'writing' }
JSONFormatDateTime class >> write: aDateAndTime [ 
	"convert to DateaAndTime without the sub-second precision"
	^ aDateAndTime rounded printString
]
