initialization
initializeFromDefinition: aDefinition
	self constraintKeywords do: [ :keyword | | constraint |
		constraint := (JSONSchemaConstraint named: keyword) new 
			initializeFromDefinition: aDefinition.
		constraint validate ifTrue: [ 
			self addConstraint: constraint ] ]