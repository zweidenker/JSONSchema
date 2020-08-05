tests
testExceedsMaximumLabelLength
	self
		assertInvalid:
			'"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijkl.com"'
		description: 'exceeds maximum label length'