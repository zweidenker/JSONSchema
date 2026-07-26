accessing
asJSONSchema
	"^ schemaClass newFromSchemaSpec: self "
	booleanValue ifNotNil: [
		^ booleanValue
			ifTrue: [ JSONSchemaAnyObject new ]
			ifFalse: [ JSONSchemaBooleanFalse new ] ].
	^ (self as: (schemaClass ifNil: [ JSONSchemaAnyObject ]))
		initializeFromDefinition: self