tests
testSimpleObjectDefinition
	| definition schema string |
	string := '{"type":"object"}'.
	definition := JSONSchemaDefinition fromString: string.
	schema := definition schema.
	self assert: schema class equals: JSONSchemaObject.
	self assert: schema jsonString equals: string