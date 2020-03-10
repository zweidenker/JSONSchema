accessing
neededKeys
	^ required 
		ifNotNil: [ required asOrderedCollection copy ]
		ifNil: [ OrderedCollection new ]