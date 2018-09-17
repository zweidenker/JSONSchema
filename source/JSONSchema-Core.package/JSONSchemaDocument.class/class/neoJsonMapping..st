accessing
neoJsonMapping: mapper
	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		(mapping mapInstVar: #definitions) valueSchema: #SchemaMap ].
		
	mapper for: #SchemaMap customDo: [ :mapping |
		mapping mapWithValueSchema: JSONSchemaDefinition ].

