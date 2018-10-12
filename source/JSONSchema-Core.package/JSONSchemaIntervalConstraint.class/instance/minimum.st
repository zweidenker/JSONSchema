accessing
minimum
	^ minimumExclusive 
		ifTrue: [ nil ]
		ifFalse: [ minimum ]