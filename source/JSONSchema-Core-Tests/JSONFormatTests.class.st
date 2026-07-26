Class {
	#name : 'JSONFormatTests',
	#superclass : 'TestCase',
	#category : 'JSONSchema-Core-Tests',
	#package : 'JSONSchema-Core-Tests'
}

{ #category : 'tests' }
JSONFormatTests >> testReadInteger [
	| object integer |
	integer := 12345.
	object := JSONIntegerFormat read: integer.
	self assert: object equals: 12345
]

{ #category : 'tests' }
JSONFormatTests >> testReadIntegerString [
	| object integer |
	integer := '12345'.
	object := JSONIntegerFormat readString: integer.
	self assert: object equals: 12345
]

{ #category : 'tests' }
JSONFormatTests >> testReadingDate [
	| object date |
	date := '2018-10-09' asDate.
	object := JSONFormatDate read: date.
	self assert: object equals: ( Date year: 2018 month: 10 day: 9 )
]

{ #category : 'tests' }
JSONFormatTests >> testReadingDateString [
	| object string |
	string := '2018-10-09'.
	object := JSONFormatDate readString: string.
	self assert: object equals: ( Date year: 2018 month: 10 day: 9 )
]

{ #category : 'tests' }
JSONFormatTests >> testReadingDateTime [
	| object dateAndTime |
	dateAndTime := DateAndTime fromString: '2018-10-09T13:15:08+01:00'.
	object := JSONFormatDateTime read: dateAndTime.
	self assert: object equals: (DateAndTime year: 2018 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour)
]

{ #category : 'tests' }
JSONFormatTests >> testReadingDateTimeString [
	| object string |
	string := '2018-10-09T13:15:08+01:00'.
	object := JSONFormatDateTime readString: string.
	self assert: object equals: (DateAndTime year: 2018 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour)
]

{ #category : 'tests' }
JSONFormatTests >> testReadingDouble [
	| object double |
	double := 1.23456789.
	object := JSONFormatDouble read: double.
	self assert: object equals: 1.23456789
]

{ #category : 'tests' }
JSONFormatTests >> testReadingDoubleString [
	| object string |
	string := '1.23456789'.
	object := JSONFormatDouble readString: string.
	self assert: object equals: 1.23456789
]

{ #category : 'tests' }
JSONFormatTests >> testReadingNegativeDoubleString [
	| object string |
	string := '-1.23456789'.
	object := JSONFormatDouble readString: string.
	self assert: object equals: -1.23456789
]

{ #category : 'tests' }
JSONFormatTests >> testReadingURI [
	| object url |
	url := 'http://www.sampledomain.org/some/path?and=arguments' asZnUrl.
	object := JSONFormatURI read: url.
	self assert: object equals: ('http://www.sampledomain.org/some/path?and=arguments' asZnUrl)
]

{ #category : 'tests' }
JSONFormatTests >> testReadingURIString [
	| object string |
	string := 'http://www.sampledomain.org/some/path?and=arguments'.
	object := JSONFormatURI readString: string.
	self assert: object equals: ('http://www.sampledomain.org/some/path?and=arguments' asZnUrl)
]

{ #category : 'tests' }
JSONFormatTests >> testWritingDate [
	| object string |
	object := Date year: 2018 month: 10 day: 9.
	string := JSONFormatDate write: object.
	self assert: string equals: '2018-10-09' 
]

{ #category : 'tests' }
JSONFormatTests >> testWritingDateTime [
	| object string |
	object := DateAndTime year: 2018 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour.
	string := JSONFormatDateTime write: object.
	self assert: string equals: '2018-10-09T13:15:08+01:00' 
]

{ #category : 'tests' }
JSONFormatTests >> testWritingDouble [
	| object string |
	object := 1.23456789.
	string := JSONFormatDouble write: object.
	self assert: string equals: '1.23456789' 
]

{ #category : 'tests' }
JSONFormatTests >> testWritingURI [
	| object string |
	object := 'http://www.sampledomain.org/some/path?and=arguments' asZnUrl .
	string := JSONFormatURI write: object.
	self assert: string equals: 'http://www.sampledomain.org/some/path?and=arguments' 
]
