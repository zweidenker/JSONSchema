as yet unclassified
testItemsWithBooleanSchemaTrue
	"items with boolean schema (true)"

	| schema data |
	schema := JSONSchema fromString: '{"items":true}'.
	"any array is valid"
	data := NeoJSONReader fromString: '[1,"foo",true]'.
	schema validate: data.
	"empty array is valid"
	data := NeoJSONReader fromString: '[]'.
	schema validate: data