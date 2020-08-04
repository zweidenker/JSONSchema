tests
testArrayUniquenessDefinition
	| schema string |
	string := '{"type":"array","uniqueItems":true}'.
	schema := self parse: string.
	
	self assert: schema constraints notEmpty.
	self assert: schema class equals: JSONSchemaArray.
	self assert: schema jsonString equals: string