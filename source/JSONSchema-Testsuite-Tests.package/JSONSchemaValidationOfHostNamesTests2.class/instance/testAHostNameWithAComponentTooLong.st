tests
testAHostNameWithAComponentTooLong
	self
		assertInvalid:
			'"a-vvvvvvvvvvvvvvvveeeeeeeeeeeeeeeerrrrrrrrrrrrrrrryyyyyyyyyyyyyyyy-long-host-name-component"'
		description: 'a host name with a component too long'