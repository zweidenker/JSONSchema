tests
testAValidIRIWithAnchorTagAndParantheses
	self
		assertValid: '"http://ƒøø.com/blah_(wîkïpédiå)_blah#ßité-1"'
		description: 'a valid IRI with anchor tag and parantheses'