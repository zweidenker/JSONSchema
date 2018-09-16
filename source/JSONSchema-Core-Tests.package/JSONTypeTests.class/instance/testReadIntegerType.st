tests
testReadIntegerType
	self 
		shouldnt: [ JSONSchemaInteger read: 123 ]
		raise: Exception 
