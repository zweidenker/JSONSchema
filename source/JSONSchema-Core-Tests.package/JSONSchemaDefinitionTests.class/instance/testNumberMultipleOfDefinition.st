tests
testNumberMultipleOfDefinition
	| schema string |
	string := '{"type":"number","multipleOf":2}'.
	schema := self parse: string.

	self assert: schema constraints notEmpty.
	self assert: schema class equals: JSONSchemaNumber.
	self assert: schema jsonString equals: string