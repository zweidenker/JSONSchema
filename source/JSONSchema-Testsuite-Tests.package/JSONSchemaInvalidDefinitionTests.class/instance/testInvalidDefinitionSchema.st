tests
testInvalidDefinitionSchema
	self
		assertInvalid: '{"definitions":{"foo":{"type":1}}}'
		description: 'invalid definition schema'