tests
testReadNumberType
	self 
		shouldnt: [ JSONSchemaNumber read: 123 ]
		raise: Exception 
