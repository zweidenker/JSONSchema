tests
testAValidlyEncodedInvalidJSONDocument
	self
		assertInvalid: '"ezp9Cg=="'
		description: 'a validly-encoded invalid JSON document'