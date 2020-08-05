tests
testAValidURL
	self
		assertValid: '"ldap://[2001:db8::7]/c=GB?objectClass?one"'
		description: 'a valid URL '