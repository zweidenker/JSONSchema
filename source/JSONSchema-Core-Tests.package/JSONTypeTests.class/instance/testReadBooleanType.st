tests
testReadBooleanType
	self 
		shouldnt: [ JSONSchemaBoolean read: true ]
		raise: Exception 
