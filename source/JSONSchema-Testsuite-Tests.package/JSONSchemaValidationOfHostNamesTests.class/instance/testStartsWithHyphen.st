tests
testStartsWithHyphen
	self assertInvalid: '"-hostname"' description: 'starts with hyphen'