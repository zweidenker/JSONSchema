accessing
schema
	"^ schemaClass newFromSchemaSpec: self "
	^ (self as: (schemaClass ifNil: [ JSONSchemaAnyObject ]))
		initializeFromDefinition: self 