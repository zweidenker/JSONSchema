tests
testAValidNewsgroupURI
	self
		assertValid: '"news:comp.infosystems.www.servers.unix"'
		description: 'a valid newsgroup URI'