reading
read: anObject
	| value |
	value := self readFormatted: anObject.
	self constraints do: [ :each | each validate: value ].
	^ value