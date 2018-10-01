accessing
constraints
	^ constraints ifNil: [ 
		constraints := OrderedCollection new ]