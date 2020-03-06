as yet unclassified
neededKeys
	^ required 
		ifNotNil: [ required asOrderedCollection copy ]
		ifNil: [ OrderedCollection new ]