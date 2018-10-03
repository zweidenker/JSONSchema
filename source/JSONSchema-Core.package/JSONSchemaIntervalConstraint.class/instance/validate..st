validation
validate: anInteger 
 
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
