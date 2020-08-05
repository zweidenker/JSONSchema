tests
testAValidPunyCodedURL
	self
		assertValid: '"http://xn--nw2a.xn--j6w193g/"'
		description: 'a valid puny-coded URL '