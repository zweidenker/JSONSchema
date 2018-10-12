tests
testNumberIntervalDefinition
	| schema string |
	string := '{"type":"number","minimum":2,"maximum":15}'.
	schema := self parse: string.
	
	self assert: schema constraints notEmpty.
	self assert: schema class equals: JSONSchemaNumber.
	self assert: schema jsonString equals: string