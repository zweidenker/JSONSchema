instance creation
neoJsonMapping: mapper
	mapper
		for: self
		customDo: [ :mapping | mapping listOfElementSchema: JSONSchemaTestMethod ]