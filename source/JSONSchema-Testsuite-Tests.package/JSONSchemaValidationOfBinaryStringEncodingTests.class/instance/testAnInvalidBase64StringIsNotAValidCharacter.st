tests
testAnInvalidBase64StringIsNotAValidCharacter
	self
		assertInvalid: '"eyJmb28iOi%iYmFyIn0K"'
		description: 'an invalid base64 string (% is not a valid character)'