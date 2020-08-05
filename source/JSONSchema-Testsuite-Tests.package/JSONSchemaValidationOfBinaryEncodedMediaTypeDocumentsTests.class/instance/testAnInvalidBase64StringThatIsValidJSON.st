tests
testAnInvalidBase64StringThatIsValidJSON
	self
		assertInvalid: '"{}"'
		description: 'an invalid base64 string that is valid JSON'