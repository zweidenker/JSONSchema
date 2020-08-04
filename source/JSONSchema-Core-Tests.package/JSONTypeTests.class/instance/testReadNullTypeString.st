tests
testReadNullTypeString
	| value |
	self 
		shouldnt: [ value := JSONSchemaNull readString: 'null' ]
		raise: JSONTypeError.
	self assert: value equals: nil 
