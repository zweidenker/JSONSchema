tests
testAHostNameWithAComponentTooLong
	self
		assertInvalid:
			'"실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실실례례테스트례례례례례례례례례례례례례례례례례테스트례례례례례례례례례례례례례례례례례례례테스트례례례례례례례례례례례례테스트례례실례.테스트"'
		description: 'a host name with a component too long'