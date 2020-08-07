tests
testEndsWithUnderscore
	self assertInvalid: '"hostname_"' description: 'ends with underscore'