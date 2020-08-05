tests
testStartsWithUnderscore
	self
		assertInvalid: '"_hostname"'
		description: 'starts with underscore'