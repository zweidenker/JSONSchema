initialization
initializeFromDefinition: aDefinition
	JSONSchemaConstraint
		subclassesDo: [ :constraintClass | 
			| constraint |
			constraint := constraintClass new
				initializeFromDefinition: aDefinition.
			constraint validate
				ifTrue: [ self addConstraint: constraint ] ]