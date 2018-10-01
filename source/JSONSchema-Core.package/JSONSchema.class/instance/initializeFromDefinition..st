initialization
initializeFromDefinition: aDefinition
	self constraintKeywords do: [ :keyword | | constraint |
		constraint := aDefinition as: (JSONSchemaConstraint named: keyword).
		constraint validate ifTrue: [  
			self addConstraint: constraint ] ]