tests
testSimpleStringDefinition
	| definition schema string |
	string := '{"type":"string"}'.
	definition := JSONSchemaDefinition fromString: string.
	schema := definition schema.
	self assert: schema class equals: JSONSchemaString.
	self assert: schema jsonString equals: string