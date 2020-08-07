visiting
visit: aNode
	groups := ReadWriteStream on: OrderedCollection new.
	^ super visit: aNode