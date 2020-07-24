tests
testObjectSizeDefinition
	| schema string |
	string := '{"type":"object","minProperties":2,"maxProperties":3}'.
	schema := self parse: string.
	
	self assert: schema constraints notEmpty.
	self assert: schema class equals: JSONSchemaObject.
	self assert: schema jsonString equals: string