as yet unclassified
testAnArrayOfSchemasForItems
	"an array of schemas for items"

	| schema data |
	schema := JSONSchema
		fromString: '{"items":[{"type":"integer"},{"type":"string"}]}'.
	"correct types"
	data := NeoJSONReader fromString: '[1,"foo"]'.
	schema validate: data.
	"wrong types"
	data := NeoJSONReader fromString: '["foo",1]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"incomplete array of items"
	data := NeoJSONReader fromString: '[1]'.
	schema validate: data.
	"array with additional items"
	data := NeoJSONReader fromString: '[1,"foo",true]'.
	schema validate: data.
	"empty array"
	data := NeoJSONReader fromString: '[]'.
	schema validate: data.
	"JavaScript pseudo-array is valid"
	data := NeoJSONReader
		fromString: '{"length":2,"0":"invalid","1":"valid"}'.
	schema validate: data