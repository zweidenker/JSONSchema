tests
testArrayMultipleItemsDefinition
	| schema |
	schema := JSONSchemaArray new
		items: { JSONSchema integer . JSONSchema string }.
	
	self 
		shouldnt: [ 
		 schema validate: { 3 . #foo } ]
		raise: JSONTypeError 