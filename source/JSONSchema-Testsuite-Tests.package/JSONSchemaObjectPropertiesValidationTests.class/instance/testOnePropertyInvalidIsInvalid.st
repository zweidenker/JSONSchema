tests
testOnePropertyInvalidIsInvalid
	self
		assertInvalid: '{"foo":1,"bar":{}}'
		description: 'one property invalid is invalid'