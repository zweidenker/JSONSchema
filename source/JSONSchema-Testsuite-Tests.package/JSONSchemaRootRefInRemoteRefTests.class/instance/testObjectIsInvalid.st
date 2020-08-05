tests
testObjectIsInvalid
	self
		assertInvalid: '{"name":{"name":null}}'
		description: 'object is invalid'