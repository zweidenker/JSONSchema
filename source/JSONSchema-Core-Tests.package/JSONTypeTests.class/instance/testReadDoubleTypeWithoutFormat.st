tests
testReadDoubleTypeWithoutFormat
	self 
		shouldnt: [ JSONSchemaNumber read: 1.2345678 ]
		raise: JSONTypeErrror  
