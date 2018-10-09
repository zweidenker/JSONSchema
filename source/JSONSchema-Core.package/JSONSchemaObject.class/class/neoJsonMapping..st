accessing
neoJsonMapping: mapper
	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		(mapping mapAccessor: #properties)  ].
	
	mapper for: #PropertiesDictionary customDo: [ :mapping |
		mapping mapWithValueSchema: JSONSchemaDefinition  ].
