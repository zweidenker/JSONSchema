reading
read: aString
	| value |
	value := self readFormatted: aString.
	self constraints do: [ :each | each validate: value ].
	^ value