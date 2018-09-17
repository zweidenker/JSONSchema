accessing
schema
	"^ schemaClass newFromSchemaSpec: self "
	^ (self as: schemaClass)
		initializeFromDefinition: self 