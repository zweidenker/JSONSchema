tests
testAValidIRIWithURLEncodedStuff
	self
		assertValid: '"http://ƒøø.ßår/?q=Test%20URL-encoded%20stuff"'
		description: 'a valid IRI with URL-encoded stuff'