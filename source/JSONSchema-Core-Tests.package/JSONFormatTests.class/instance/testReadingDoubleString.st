tests
testReadingDoubleString
	| object string |
	string := '1.23456789'.
	object := JSONFormatDouble readString: string.
	self assert: object equals: 1.23456789