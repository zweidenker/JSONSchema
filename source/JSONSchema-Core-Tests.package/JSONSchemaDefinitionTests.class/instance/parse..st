tests
parse: aString
	^ (JSONSchemaDefinition fromString: aString) schema.