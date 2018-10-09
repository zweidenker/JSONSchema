tests
testSimpleNumberDefinition
	| definition schema string |
	string := '{"type":"number"}'.
	definition := JSONSchemaDefinition fromString: string.
	schema := definition schema.
	self assert: schema class equals: JSONSchemaNumber.
	self assert: schema jsonString equals: string