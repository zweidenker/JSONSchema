tests
testReadBooleanTypeMismatch
	self 
		should: [ JSONSchemaBoolean new read: 123]
		raise: JSONTypeError.
