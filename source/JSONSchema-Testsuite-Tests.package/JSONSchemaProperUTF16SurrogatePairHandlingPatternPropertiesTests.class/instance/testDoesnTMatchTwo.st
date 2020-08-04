tests
testDoesnTMatchTwo
	self
		assertInvalid: '{"🐲🐲":"hello"}'
		description: 'doesn''t match two'