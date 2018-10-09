tests
testSimpleNullDefinition
	| definition schema string |
	string := '{"type":"null"}'.
	definition := JSONSchemaDefinition fromString: string.
	schema := definition schema.
	self assert: schema class equals: JSONSchemaNull.
	self assert: schema jsonString equals: string