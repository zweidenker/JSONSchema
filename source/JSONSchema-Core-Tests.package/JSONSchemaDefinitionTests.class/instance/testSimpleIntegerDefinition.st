tests
testSimpleIntegerDefinition
	| definition schema string |
	string := '{"type":"integer"}'.
	definition := JSONSchemaDefinition fromString: string.
	schema := definition schema.
	self assert: schema class equals: JSONSchemaInteger.
	self assert: schema jsonString equals: string