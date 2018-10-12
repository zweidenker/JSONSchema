accessing
multipleOf: aNumber
	self addConstraint: (JSONSchemaMultipleOfConstraint number: aNumber )