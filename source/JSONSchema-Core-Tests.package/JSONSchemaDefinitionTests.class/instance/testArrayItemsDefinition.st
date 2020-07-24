tests
testArrayItemsDefinition
	| schema string |
	string := '{"type":"array","minItems":2,"maxItems":3}'.
	schema := self parse: string.
	
	self assert: schema constraints notEmpty.
	self assert: schema class equals: JSONSchemaArray.
	self assert: schema jsonString equals: string