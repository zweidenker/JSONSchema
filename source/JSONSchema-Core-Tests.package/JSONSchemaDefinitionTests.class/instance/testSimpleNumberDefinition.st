tests
testSimpleNumberDefinition
	| schema string |
	string := '{"type":"number"}'.
	schema := self parse: string.
	self assert: schema class equals: JSONSchemaNumber.
	self assert: schema jsonString equals: string