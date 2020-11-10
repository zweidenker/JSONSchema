writing
write: anObject on: writer
	anObject ifNil: [ 
		nullable ifTrue: [ 
			^ writer writeNull ] ].
	^ writer writeString: (self write: anObject)