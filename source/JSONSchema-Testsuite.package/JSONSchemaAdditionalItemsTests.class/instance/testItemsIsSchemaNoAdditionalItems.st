as yet unclassified
testItemsIsSchemaNoAdditionalItems
	"items is schema, no additionalItems"

	| schema data |
	schema := JSONSchema
		fromString: '{"items":{},"additionalItems":false}'.
	"all items match schema"
	data := NeoJSONReader fromString: '[1,2,3,4,5]'.
	schema validate: data