accessing
neoJsonMapping: mapper
	mapper for: self do: [ :mapping |
		mapping mapAccessor: #reference to: '$ref'.
		mapping mapInstVars: #( title ).
		mapping mapAccessors: #( required ).
		(mapping mapAccessor: #properties) valueSchema: #PropertiesDictionary.
		(mapping mapAccessor: #items) valueSchema: JSONSchemaSpec.
		"mapping mapAccessors: #( multipleOf maximum exclusiveMaximum minimum exclusiveMinimum maxLength minLength pattern maxItems minItems uniqueItems maxProperties minProperties enum )."
		(mapping mapAccessor: #allOf) valueSchema: #SchemaList.
		"mapping mapAccessors: #( oneOf anyOf not items additionalProperties description  )."
		mapping mapAccessor: #typeString mutator: #typeString: to: #type.
		 ].
	mapper for: #PropertiesDictionary customDo: [ :mapping |
		mapping mapWithValueSchema: JSONSchemaSpec  ].
	mapper for: #SchemaList customDo: [ :mapping |
		mapping listOfElementSchema: JSONSchemaSpec. ]