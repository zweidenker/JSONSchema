validation
validate: anObject
	| factor |
	factor := anObject / number.
	(factor = factor asInteger) ifFalse: [ 
		JSONConstraintError signal: anObject asString, ' is not a multiple of ', number asString ] 