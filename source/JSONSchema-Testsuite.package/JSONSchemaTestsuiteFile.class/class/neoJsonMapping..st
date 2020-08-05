accessing
neoJsonMapping: mapper
	mapper
		for: self
		customDo: [ :mapping | mapping listOfElementSchema: JSONSchemaTestsuiteGroup ]