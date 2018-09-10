tests
testParseExample3
	| schema |
	schema := JSONSchema fromString: self exampleSchema3.
	schema validate: (NeoJSONReader fromString: self exampleData3)