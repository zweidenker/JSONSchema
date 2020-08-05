tests
testReadNullTypeMismatch
	self 
		should: [ JSONSchemaNull new read: 123]
		raise: JSONTypeError.
