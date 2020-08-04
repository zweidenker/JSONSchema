tests
testMaximumLabelLength
	self
		assertValid:
			'"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijk.com"'
		description: 'maximum label length'