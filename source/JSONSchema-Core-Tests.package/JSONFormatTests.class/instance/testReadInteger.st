tests
testReadInteger
	| object integer |
	integer := 12345.
	object := JSONIntegerFormat read: integer.
	self assert: object equals: 12345