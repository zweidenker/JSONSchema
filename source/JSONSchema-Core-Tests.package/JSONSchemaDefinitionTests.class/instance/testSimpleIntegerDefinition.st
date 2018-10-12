tests
testSimpleIntegerDefinition
	|  schema string |
	string := '{"type":"integer"}'.
	schema := self parse: string.
	self assert: schema class equals: JSONSchemaInteger.
	self assert: schema jsonString equals: string