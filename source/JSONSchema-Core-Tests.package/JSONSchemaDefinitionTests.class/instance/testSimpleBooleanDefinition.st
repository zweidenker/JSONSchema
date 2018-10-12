tests
testSimpleBooleanDefinition
	| schema string |
	string := '{"type":"boolean"}'.
	schema := self parse: string.
	self assert: schema class equals: JSONSchemaBoolean.
	self assert: schema jsonString equals: string