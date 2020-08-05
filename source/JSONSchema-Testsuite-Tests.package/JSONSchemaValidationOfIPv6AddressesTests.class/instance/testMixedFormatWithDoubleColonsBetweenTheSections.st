tests
testMixedFormatWithDoubleColonsBetweenTheSections
	self
		assertValid: '"1:2::192.168.0.1"'
		description: 'mixed format with double colons between the sections'