as yet unclassified
testAdditionalItemsAsSchema
	"additionalItems as schema"

	| schema data |
	schema := JSONSchema
		fromString: '{"items":[{}],"additionalItems":{"type":"integer"}}'.
	"additional items match schema"
	data := NeoJSONReader fromString: '[null,2,3,4]'.
	schema validate: data.
	"additional items do not match schema"
	data := NeoJSONReader fromString: '[null,2,3,"foo"]'.
	self should: [ schema validate: data ] raise: JSONSchemaError