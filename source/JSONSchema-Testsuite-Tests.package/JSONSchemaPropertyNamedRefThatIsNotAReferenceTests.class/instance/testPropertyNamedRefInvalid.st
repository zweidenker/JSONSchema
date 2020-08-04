tests
testPropertyNamedRefInvalid
	self
		assertInvalid: '{"$ref":2}'
		description: 'property named $ref invalid'