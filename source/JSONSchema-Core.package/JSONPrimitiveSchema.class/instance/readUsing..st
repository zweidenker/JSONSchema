private
readUsing: aReader 
	| value |
	value := aReader parseValue.
	value ifNil: [ 
		nullable ifTrue: [ ^ nil ] ].
	^ self read: value