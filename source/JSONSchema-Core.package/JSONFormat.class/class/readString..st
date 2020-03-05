reading
readString: aString 
	self validateString: aString.
	^ self read: (self convertString: aString)