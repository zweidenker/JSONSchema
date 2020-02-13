tests
testWritingDate
	| object string |
	object := Date year: 2018 month: 10 day: 9.
	string := JSONFormatDate write: object.
	self assert: string equals: '2018-10-09' 