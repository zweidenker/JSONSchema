tests
testASingleValidMatchIsValid
	self
		assertValid: '{"foo":1}'
		description: 'a single valid match is valid'