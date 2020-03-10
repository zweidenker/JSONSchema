tests
testReadBooleanType
	| value |
	self 
		shouldnt: [ value := JSONSchemaBoolean read: true ]
		raise: Exception.
	self assert: value equals: true