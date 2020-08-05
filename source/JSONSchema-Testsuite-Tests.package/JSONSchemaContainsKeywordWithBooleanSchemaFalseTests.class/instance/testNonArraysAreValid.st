tests
testNonArraysAreValid
	self
		assertValid: '"contains does not apply to strings"'
		description: 'non-arrays are valid'