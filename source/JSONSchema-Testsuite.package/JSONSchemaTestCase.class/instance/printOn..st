printing
printOn: aStream
	super printOn: aStream.
	name notNil
		ifTrue: [ aStream
				space;
				nextPut: $(;
				print: name;
				nextPut: $) ]