writing
write: anObject on: aWriter 
	anObject ifNil: [ 
		nullable ifTrue: [ 
			^ aWriter writeNull ] ].
	self validate: anObject.
	aWriter nextPut: anObject