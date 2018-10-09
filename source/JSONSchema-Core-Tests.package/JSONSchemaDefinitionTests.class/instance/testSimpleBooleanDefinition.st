tests
testSimpleBooleanDefinition
	| definition schema string |
	string := '{"type":"boolean"}'.
	definition := JSONSchemaDefinition fromString: string.
	schema := definition schema.
	self assert: schema class equals: JSONSchemaBoolean.
	self assert: schema jsonString equals: string