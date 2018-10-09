tests
testWritingDateTime
	| object string |
	object := DateAndTime year: 2018 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour.
	string := JSONFormatDateTime write: object.
	self assert: string equals: '2018-10-09T13:15:08+01:00' 