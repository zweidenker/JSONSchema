validation
validate: aDictionary 
	(minProperties notNil & maxProperties notNil) ifTrue: [ 
		(aDictionary size between: minProperties and: maxProperties) 
			ifTrue: [ ^ self ]
			ifFalse: [ JSONConstraintError signal: aDictionary asString, ' must have size between ', minProperties asString, ' and ', maxProperties asString ] ].
	
	minProperties notNil ifTrue: [ 
		(aDictionary size >= minProperties) ifFalse: [ 
			 JSONConstraintError signal: aDictionary asString, ' must have a minimum size of ', minProperties asString ]  ].
	
	maxProperties notNil ifTrue: [ 
		(aDictionary size <= maxProperties) ifFalse: [ 
			 JSONConstraintError signal: aDictionary asString, ' must have a maximum size of ', maxProperties asString ]  ]