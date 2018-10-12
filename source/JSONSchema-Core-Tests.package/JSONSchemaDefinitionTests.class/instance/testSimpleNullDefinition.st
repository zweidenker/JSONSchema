tests
testSimpleNullDefinition
	| schema string |
	string := '{"type":"null"}'.
	schema := self parse: string.
	self assert: schema class equals: JSONSchemaNull.
	self assert: schema jsonString equals: string