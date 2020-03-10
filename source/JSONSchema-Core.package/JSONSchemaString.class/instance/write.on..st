writing
write: anObject on: writer
	^ writer writeString: (self write: anObject)