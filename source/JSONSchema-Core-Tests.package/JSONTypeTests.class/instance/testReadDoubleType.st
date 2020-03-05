tests
testReadDoubleType
	self 
		shouldnt: [ JSONSchemaNumber read: 1.2345678 format: #double ]
		raise: JSONTypeErrror  
