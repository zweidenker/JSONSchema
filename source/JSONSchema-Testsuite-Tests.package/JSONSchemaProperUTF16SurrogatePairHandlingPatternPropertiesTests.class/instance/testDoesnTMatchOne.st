tests
testDoesnTMatchOne
	self assertInvalid: '{"🐲":"hello"}' description: 'doesn''t match one'