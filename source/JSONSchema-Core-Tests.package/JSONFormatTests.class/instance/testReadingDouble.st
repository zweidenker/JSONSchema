tests
testReadingDouble
	| object string |
	string := '1.23456789'.
	object := JSONFormatDouble read: string.
	self assert: object equals: 1.23456789