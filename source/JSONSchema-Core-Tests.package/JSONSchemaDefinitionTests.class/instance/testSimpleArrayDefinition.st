tests
testSimpleArrayDefinition
	| definition schema string |
	string := '{"type":"array"}'.
	definition := JSONSchemaDefinition fromString: string.
	schema := definition schema.
	self assert: schema class equals: JSONSchemaArray.
	self assert: schema jsonString equals: string