tests
testReadingDouble
	| object double |
	double := 1.23456789.
	object := JSONFormatDouble read: double.
	self assert: object equals: 1.23456789