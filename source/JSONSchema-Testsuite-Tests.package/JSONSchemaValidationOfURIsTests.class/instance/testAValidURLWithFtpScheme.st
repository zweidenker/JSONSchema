tests
testAValidURLWithFtpScheme
	self
		assertValid: '"ftp://ftp.is.co.za/rfc/rfc1808.txt"'
		description: 'a valid URL with ftp scheme'