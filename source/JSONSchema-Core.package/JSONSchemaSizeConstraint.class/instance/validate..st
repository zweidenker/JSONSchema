validation
validate: aString 
	(minProperties notNil & maxProperties notNil) ifTrue: [ 
		(aString size between: minProperties and: maxProperties) 
			ifTrue: [ ^ self ]
			ifFalse: [ JSONConstraintError signal: aString, ' must have size between ', minProperties asString, ' and ', maxProperties asString ] ].
	
	minProperties notNil ifTrue: [ 
		(aString size >= minProperties) ifFalse: [ 
			 JSONConstraintError signal: aString, ' must have a minimum size of ', minProperties asString ]  ].
	
	maxProperties notNil ifTrue: [ 
		(aString size <= maxProperties) ifFalse: [ 
			 JSONConstraintError signal: aString, ' must have a maximum size of ', maxProperties asString ]  ]