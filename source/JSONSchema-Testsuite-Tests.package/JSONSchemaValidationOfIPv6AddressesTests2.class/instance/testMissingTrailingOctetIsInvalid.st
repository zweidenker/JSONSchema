tests
testMissingTrailingOctetIsInvalid
	self
		assertInvalid: '"1:2:3:4:5:6:7:"'
		description: 'missing trailing octet is invalid'