writing
write: aNumber on: aWriter 
	aNumber ifNil: [ 
		nullable ifTrue: [ 
			^ aWriter writeNull ] ].
	self validate: aNumber.
	aWriter nextPut: aNumber