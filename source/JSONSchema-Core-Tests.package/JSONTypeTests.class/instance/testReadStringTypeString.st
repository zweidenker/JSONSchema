tests
testReadStringTypeString
	self 
		shouldnt: [ JSONSchemaString readString: '123' ]
		raise: JSONTypeError  
