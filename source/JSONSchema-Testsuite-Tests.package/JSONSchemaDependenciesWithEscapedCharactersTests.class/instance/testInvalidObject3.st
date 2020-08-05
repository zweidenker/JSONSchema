tests
testInvalidObject3
	self assertInvalid: '{"foo''bar":1}' description: 'invalid object 3'