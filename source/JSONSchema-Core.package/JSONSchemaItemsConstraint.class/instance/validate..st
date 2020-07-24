validation
validate: aString 
	(minItems notNil & maxItems notNil) ifTrue: [ 
		(aString size between: minItems and: maxItems) 
			ifTrue: [ ^ self ]
			ifFalse: [ JSONConstraintError signal: aString, ' must have between ', minItems asString, ' and ', maxItems asString , 'items' ] ].
	
	minItems notNil ifTrue: [ 
		(aString size >= minItems) ifFalse: [ 
			 JSONConstraintError signal: aString, ' must have a minimum of ', minItems asString , 'items'  ]  ].
	
	maxItems notNil ifTrue: [ 
		(aString size <= maxItems) ifFalse: [ 
			 JSONConstraintError signal: aString, ' must have a maximum of ', maxItems asString , 'items'  ]  ]