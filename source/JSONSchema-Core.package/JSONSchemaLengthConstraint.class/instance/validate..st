validation
validate: aString 
	(minLength notNil & maxLength notNil) ifTrue: [ 
		(aString size between: minLength and: maxLength) 
			ifTrue: [ ^ self ]
			ifFalse: [ JSONConstraintError signal: aString, ' must have length between ', minLength asString, ' and ', maxLength asString ] ].
	
	minLength notNil ifTrue: [ 
		(aString size >= minLength) ifFalse: [ 
			 JSONConstraintError signal: aString, ' must have a minimum length of ', minLength asString ]  ].
	
	maxLength notNil ifTrue: [ 
		(aString size <= maxLength) ifFalse: [ 
			 JSONConstraintError signal: aString, ' must have a maximum length of ', minLength asString ]  ]