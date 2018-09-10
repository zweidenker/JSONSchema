tests
testParseExample2
	| schema |
	schema := JSONSchemaDocument fromString: self exampleSchema2.
	schema validate: (NeoJSONReader fromString: self exampleData2)