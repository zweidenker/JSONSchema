tests
testWritingDouble
	| object string |
	object := 1.23456789.
	string := JSONFormatDouble write: object.
	self assert: string equals: '1.23456789' 