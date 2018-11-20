accessing
neoJsonMapping: mapper
	mapper for: self do: [ :mapping |
		mapping mapAccessor: #reference to: '$ref'.
		mapping mapInstVars: #( title ).
		mapping mapAccessors: #( required description enum ).
		mapping mapAccessor: #formatString mutator: #formatString: to: #format.
		(mapping mapAccessor: #properties) valueSchema: #PropertiesDictionary.
		(mapping mapAccessor: #items) valueSchema: JSONSchemaDefinition.
		mapping mapAccessors: #( oneOf anyOf not additionalProperties multipleOf maximum exclusiveMaximum minimum exclusiveMinimum maxLength minLength pattern maxItems minItems uniqueItems maxProperties minProperties  ).
		(mapping mapAccessor: #allOf) valueSchema: #SchemaList.
		mapping mapAccessor: #typeString mutator: #typeString: to: #type.
		 ].
	mapper for: #PropertiesDictionary customDo: [ :mapping |
		mapping mapWithValueSchema: JSONSchemaDefinition  ].
	mapper for: #SchemaList customDo: [ :mapping |
		mapping listOfElementSchema: JSONSchemaDefinition. ]