tests
testStringLengthDefinition
	| schema string |
	string := '{"type":"string","minLength":2,"maxLength":15}'.
	schema := self parse: string.
	
	self assert: schema constraints notEmpty.
	self assert: schema class equals: JSONSchemaString .
	self assert: schema jsonString equals: string