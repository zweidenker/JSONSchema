tests
testSimpleObjectDefinition
	| schema string |
	string := '{"type":"object"}'.
	schema := self parse: string.
	self assert: schema class equals: JSONSchemaObject.
	self assert: schema jsonString equals: string