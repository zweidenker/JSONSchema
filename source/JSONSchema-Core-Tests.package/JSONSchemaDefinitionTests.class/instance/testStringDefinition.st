tests
testStringDefinition
	| schema string |
	string := '{"type":"string"}'.
	schema := self parse: string.
	self assert: schema class equals: JSONSchemaString.
	self assert: schema jsonString equals: string