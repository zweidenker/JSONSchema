accessing
exclusiveMaximum
	^ maximumExclusive 
		ifTrue: [ maximum ]
		ifFalse: [ nil ]