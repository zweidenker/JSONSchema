tests
testParseExample2
	| schema |
	schema := JSONSchema fromString: self exampleSchema2.
	schema validate: (NeoJSONReader fromString: self exampleData2)