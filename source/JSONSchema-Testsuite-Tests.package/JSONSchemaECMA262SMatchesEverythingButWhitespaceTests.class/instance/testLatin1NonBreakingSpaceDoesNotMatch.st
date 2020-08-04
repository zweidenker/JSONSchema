tests
testLatin1NonBreakingSpaceDoesNotMatch
	self
		assertInvalid: '" "'
		description: 'latin-1 non-breaking-space does not match'