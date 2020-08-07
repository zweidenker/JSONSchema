visiting
visit: aNode
	tests := ReadWriteStream on: OrderedCollection new.
	^ super visit: aNode