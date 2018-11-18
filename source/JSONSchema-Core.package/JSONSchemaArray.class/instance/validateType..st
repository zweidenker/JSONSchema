validating
validateType: aCollection 
	aCollection do: [ :each | 
		items validateType: each ]