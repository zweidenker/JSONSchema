tests
testReadDoubleTypeStringWithoutFormat
	self 
		shouldnt: [ JSONSchemaNumber readString: '1.2345678' ]
		raise: JSONTypeErrror  
