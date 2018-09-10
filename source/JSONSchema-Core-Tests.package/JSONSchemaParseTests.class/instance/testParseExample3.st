tests
testParseExample3
	| schema |
	schema := JSONSchemaDocument fromString: self exampleSchema3.
	schema validate: (NeoJSONReader fromString: self exampleData3)