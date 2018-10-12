accessing
exclusiveMinimum
	^ minimumExclusive 
		ifTrue: [ minimum ]
		ifFalse: [ nil ]