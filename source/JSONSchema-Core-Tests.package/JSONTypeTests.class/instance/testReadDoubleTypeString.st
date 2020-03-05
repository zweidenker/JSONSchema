tests
testReadDoubleTypeString
	self 
		shouldnt: [ JSONSchemaNumber readString: '1.2345678' format: #double ]
		raise: JSONTypeError  
