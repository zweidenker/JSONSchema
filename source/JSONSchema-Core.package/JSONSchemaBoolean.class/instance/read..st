reading-primitive data
read: aBoolean
	(aBoolean isKindOf: Boolean) ifFalse: [  
		^ JSONTypeError signal: 'not a boolean' ].
	^ aBoolean
	