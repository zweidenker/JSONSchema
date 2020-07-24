validation
validate: anArray 
	(minItems notNil & maxItems notNil) ifTrue: [ 
		(anArray size between: minItems and: maxItems) 
			ifTrue: [ ^ self ]
			ifFalse: [ JSONConstraintError signal: anArray asString, ' must have between ', minItems asString, ' and ', maxItems asString , ' items' ] ].
	
	minItems notNil ifTrue: [ 
		(anArray size >= minItems) ifFalse: [ 
			 JSONConstraintError signal: anArray asString, ' must have a minimum of ', minItems asString , ' items'  ]  ].
	
	maxItems notNil ifTrue: [ 
		(anArray size <= maxItems) ifFalse: [ 
			 JSONConstraintError signal: anArray asString, ' must have a maximum of ', maxItems asString , ' items'  ]  ]