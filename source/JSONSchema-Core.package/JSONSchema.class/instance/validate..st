validation
validate: anObject
	self validateType: anObject.
	self constraints
		select: [ :constraint | constraint validateType: anObject ]
		thenDo: [ :constraint | constraint validate: anObject ]