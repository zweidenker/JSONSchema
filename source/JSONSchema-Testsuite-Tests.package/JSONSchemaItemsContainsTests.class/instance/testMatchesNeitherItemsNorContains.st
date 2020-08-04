tests
testMatchesNeitherItemsNorContains
	self
		assertInvalid: '[1,5]'
		description: 'matches neither items nor contains'