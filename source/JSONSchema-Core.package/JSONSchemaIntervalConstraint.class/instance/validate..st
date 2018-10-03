validation
validate: anInteger 
	
	(minimum notNil & maximum notNil) ifTrue: [ 
		(anInteger between: minimum and: maximum) ifFalse: [ 
		 	JSONConstraintError signal: anInteger asString,' must be between ', minimum asString, ' and ', maximum asString ] ].
 
	minimum notNil ifTrue: [ 
		minimumExclusive 
			ifTrue: [ 
				(anInteger > minimum) ifFalse: [ 
					JSONConstraintError signal: anInteger asString,' must be greater than ', minimum asString ] ]
			ifFalse: [ 
				(anInteger >= minimum) ifFalse: [ 
					JSONConstraintError signal: anInteger asString,' must be greater than or equal to ', minimum asString ] ]].
		
	maximum notNil ifTrue: [ 
		maximumExclusive 
			ifTrue: [ 
				(anInteger < maximum) ifFalse: [ 
					JSONConstraintError signal: anInteger asString,' must be less than  ', maximum asString ] ]
			ifFalse: [ 
				(anInteger <= maximum) ifFalse: [ 
					JSONConstraintError signal: anInteger asString,' must be less than or equal to ', maximum asString ] ]].

