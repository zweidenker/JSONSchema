accessing
neoJsonMapping: mapper
	mapper
		for: self
		do: [ :mapping | 
			mapping mapInstVars: #(description schema tests).
			(mapping mapInstVar: #tests) valueSchema: #ArrayOfTests ].
	mapper
		for: #ArrayOfTests
		customDo: [ :mapping | mapping listOfElementSchema: JSONSchemaTest ]