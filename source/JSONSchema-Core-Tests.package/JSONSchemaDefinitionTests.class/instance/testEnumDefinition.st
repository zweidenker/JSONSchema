tests
testEnumDefinition
	| schema string |
	string := '{"type":"string","enum":["one","two","three"]}'.
	schema := self parse: string.
	
	self assert: schema constraints notEmpty.
	self assert: schema class equals: JSONSchemaString.
	self assert: schema jsonString equals: string
	