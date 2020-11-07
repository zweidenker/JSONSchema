tests
testArrayMultipleItemsDefinitionDifferentSizes
	| schema |
	schema := JSONSchemaArray new
		items: { JSONSchema integer . JSONSchema string . JSONSchema boolean }.
	
	self 
		should: [ 
		 schema validate: { 3 . #foo } ]
		raise: JSONTypeError 