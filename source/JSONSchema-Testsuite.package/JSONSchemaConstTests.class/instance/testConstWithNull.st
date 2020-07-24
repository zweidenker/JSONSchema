as yet unclassified
testConstWithNull
	"const with null"

	| schema data |
	schema := JSONSchema fromString: '{"const":null}'.
	"null is valid"
	data := NeoJSONReader fromString: 'null'.
	schema validate: data.
	"not null is invalid"
	data := NeoJSONReader fromString: '0'.
	self should: [ schema validate: data ] raise: JSONSchemaError