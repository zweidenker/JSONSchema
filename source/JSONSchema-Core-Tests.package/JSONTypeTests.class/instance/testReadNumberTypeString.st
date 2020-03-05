tests
testReadNumberTypeString
	self 
		shouldnt: [ JSONSchemaNumber readString: '123' ]
		raise: JSONTypeError  
