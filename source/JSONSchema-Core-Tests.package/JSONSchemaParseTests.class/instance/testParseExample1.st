tests
testParseExample1
	| schema |
	schema := JSONSchemaDocument fromString: self exampleSchema1.
	schema validate: (NeoJSONReader fromString: self exampleData1)