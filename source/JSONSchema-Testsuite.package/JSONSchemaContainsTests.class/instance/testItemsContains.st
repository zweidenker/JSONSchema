as yet unclassified
testItemsContains
	"items + contains"

	| schema data |
	schema := JSONSchema
		fromString: '{"items":{"multipleOf":2},"contains":{"multipleOf":3}}'.
	"matches items, does not match contains"
	data := NeoJSONReader fromString: '[2,4,8]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"does not match items, matches contains"
	data := NeoJSONReader fromString: '[3,6,9]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"matches both items and contains"
	data := NeoJSONReader fromString: '[6,12]'.
	schema validate: data.
	"matches neither items nor contains"
	data := NeoJSONReader fromString: '[1,5]'.
	self should: [ schema validate: data ] raise: JSONSchemaError