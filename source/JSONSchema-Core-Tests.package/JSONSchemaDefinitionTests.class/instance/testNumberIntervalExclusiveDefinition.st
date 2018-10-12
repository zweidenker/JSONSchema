tests
testNumberIntervalExclusiveDefinition
	| schema string |
	string := '{"type":"number","exclusiveMinimum":2,"exclusiveMaximum":15}'.
	schema := self parse: string.
	
	self assert: schema constraints notEmpty.
	self assert: schema class equals: JSONSchemaNumber.
	self assert: schema jsonString equals: string