tests
testReadingDate
	| object date |
	date := '2018-10-09' asDate.
	object := JSONFormatDate read: date.
	self assert: object equals: ( Date year: 2018 month: 10 day: 9 )