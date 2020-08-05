tests
testReadNullType
	| value |
	self 
		shouldnt: [ value := JSONSchemaNull read: nil ]
		raise: Exception.
	self assert: value equals: nil