tests
testObjectWithAllNumbersIsValid
	self
		assertValid:
			'{"foo\"bar":1,"foo\\bar":1,"foo\tbar":1,"foo\nbar":1,"foo\rbar":1,"foo\fbar":1}'
		description: 'object with all numbers is valid'