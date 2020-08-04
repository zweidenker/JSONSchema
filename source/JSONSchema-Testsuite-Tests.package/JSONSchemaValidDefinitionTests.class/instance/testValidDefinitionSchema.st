tests
testValidDefinitionSchema
	self
		assertValid: '{"definitions":{"foo":{"type":"integer"}}}'
		description: 'valid definition schema'