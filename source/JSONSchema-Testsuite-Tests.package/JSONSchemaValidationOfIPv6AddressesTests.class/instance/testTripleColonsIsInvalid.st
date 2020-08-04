tests
testTripleColonsIsInvalid
	self
		assertInvalid: '"1:2:3:4:5:::8"'
		description: 'triple colons is invalid'