validation
validate: anObject
	self validateType: anObject.
	self constraints do: [ :constraint | constraint validate: anObject ]