as yet unclassified
testItemsWithBooleanSchemas
	"items with boolean schemas"

	| schema data |
	schema := JSONSchema fromString: '{"items":[true,false]}'.
	"array with one item is valid"
	data := NeoJSONReader fromString: '[1]'.
	schema validate: data.
	"array with two items is invalid"
	data := NeoJSONReader fromString: '[1,"foo"]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"empty array is valid"
	data := NeoJSONReader fromString: '[]'.
	schema validate: data