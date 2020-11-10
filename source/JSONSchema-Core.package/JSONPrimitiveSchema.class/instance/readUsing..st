private
readUsing: aReader 
	| value |
	value := aReader parseValue.
	value ifNil: [ 
		nullable 
			ifTrue: [ ^ nil ]
			ifFalse: [ JSONTypeError signal: self class typeName, ' cannot be nil' ] ].
	^ self read: value