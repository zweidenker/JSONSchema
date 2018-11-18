accessing
interval 
	| constraint |
	constraint := JSONSchemaIntervalConstraint new.
	self addConstraint: constraint.
	^ constraint