tests
testDoesnTInvalidateOtherProperties
	self
		assertValid: '{"quux":[]}'
		description: 'doesn''t invalidate other properties'