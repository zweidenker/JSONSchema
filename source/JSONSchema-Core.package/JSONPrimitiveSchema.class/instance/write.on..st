writing
write: aNumber on: aWriter 
	self validate: aNumber.
	aWriter nextPut: aNumber