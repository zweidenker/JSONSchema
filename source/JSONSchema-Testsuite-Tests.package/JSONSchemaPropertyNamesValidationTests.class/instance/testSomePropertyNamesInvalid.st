tests
testSomePropertyNamesInvalid
	self
		assertInvalid: '{"foobar":{},"foo":{}}'
		description: 'some property names invalid'