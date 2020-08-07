private
classNameFromGroup: aJSONSchemaTestsuiteGroup
	^ #JSONSchema
		, (self identifierFromString: aJSONSchemaTestsuiteGroup description)
		, #Tests