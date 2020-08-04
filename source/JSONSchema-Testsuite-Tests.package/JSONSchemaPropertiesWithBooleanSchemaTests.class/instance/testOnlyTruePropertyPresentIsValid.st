tests
testOnlyTruePropertyPresentIsValid
	self
		assertValid: '{"foo":1}'
		description: 'only ''true'' property present is valid'