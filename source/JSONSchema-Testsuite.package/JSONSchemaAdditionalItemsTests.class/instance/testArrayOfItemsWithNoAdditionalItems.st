as yet unclassified
testArrayOfItemsWithNoAdditionalItems
	"array of items with no additionalItems"

	| schema data |
	schema := JSONSchema
		fromString: '{"items":[{},{},{}],"additionalItems":false}'.
	"empty array"
	data := NeoJSONReader fromString: '[]'.
	schema validate: data.
	"fewer number of items present (1)"
	data := NeoJSONReader fromString: '[1]'.
	schema validate: data.
	"fewer number of items present (2)"
	data := NeoJSONReader fromString: '[1,2]'.
	schema validate: data.
	"equal number of items present"
	data := NeoJSONReader fromString: '[1,2,3]'.
	schema validate: data.
	"additional items are not permitted"
	data := NeoJSONReader fromString: '[1,2,3,4]'.
	self should: [ schema validate: data ] raise: JSONSchemaError