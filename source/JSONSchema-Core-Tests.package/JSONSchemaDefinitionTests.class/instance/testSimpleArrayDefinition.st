tests
testSimpleArrayDefinition
	|  schema string |
	string := '{"type":"array"}'.
	schema := self parse: string.
	self assert: schema class equals: JSONSchemaArray.
	self assert: schema jsonString equals: string