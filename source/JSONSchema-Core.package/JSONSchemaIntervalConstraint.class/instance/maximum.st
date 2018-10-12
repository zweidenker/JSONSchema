accessing
maximum
	^ maximumExclusive 
		ifTrue: [ nil ]
		ifFalse: [ maximum ]