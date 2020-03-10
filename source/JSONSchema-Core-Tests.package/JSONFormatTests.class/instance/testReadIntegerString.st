tests
testReadIntegerString
	| object integer |
	integer := '12345'.
	object := JSONIntegerFormat readString: integer.
	self assert: object equals: 12345