as yet unclassified
testItemsWithBooleanSchemaFalse
	"items with boolean schema (false)"

	| schema data |
	schema := JSONSchema fromString: '{"items":false}'.
	"any non-empty array is invalid"
	data := NeoJSONReader fromString: '[1,"foo",true]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"empty array is valid"
	data := NeoJSONReader fromString: '[]'.
	schema validate: data