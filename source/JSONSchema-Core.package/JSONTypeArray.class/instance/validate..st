validating
validate: aCollection 
	aCollection do: [ :each | 
		items validate: each ]