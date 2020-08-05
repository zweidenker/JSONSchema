tests
testPercentInvalid
	self
		assertInvalid: '{"percent":"aoeu"}'
		description: 'percent invalid'