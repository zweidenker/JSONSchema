tests
testAValidPunycodedIDNHostname
	self
		assertValid: '"xn--4gbwdl.xn--wgbh1c"'
		description: 'a valid punycoded IDN hostname'