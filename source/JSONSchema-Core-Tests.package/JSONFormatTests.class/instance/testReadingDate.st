tests
testReadingDate
	| object string |
	string := '2018-10-09'.
	object := JSONFormatDate read: string.
	self assert: object equals: ( Date year: 2018 month: 10 day: 9 )