validation
validate: anObject
	self constraints do: [ :constraint | constraint validate: anObject ]