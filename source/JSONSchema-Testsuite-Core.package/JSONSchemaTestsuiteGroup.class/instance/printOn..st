printing
printOn: aStream
	super printOn: aStream.
	description notNil
		ifTrue: [ aStream
				space;
				nextPut: $(;
				print: description;
				nextPut: $) ]