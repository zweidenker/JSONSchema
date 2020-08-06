tests
testDoNotMatchStringLackingNul
	self
		assertInvalid: '"hellothere"'
		description: 'do not match string lacking nul'