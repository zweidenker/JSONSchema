tests
testReadingDateTime
	| object dateAndTime |
	dateAndTime := DateAndTime fromString: '2018-10-09T13:15:08+01:00'.
	object := JSONFormatDateTime read: dateAndTime.
	self assert: object equals: (DateAndTime year: 2018 month: 10 day: 9 hour: 13 minute: 15 second: 8 offset: 1 hour)