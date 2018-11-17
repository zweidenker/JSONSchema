tests
parse: aString
	^ (JSONSchemaDefinition fromString: aString) asJSONSchema.