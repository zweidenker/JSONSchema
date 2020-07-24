as yet unclassified
testTypeAsArrayWithOneItem
	"type as array with one item"

	| schema data |
	schema := JSONSchema fromString: '{"type":["string"]}'.
	"string is valid"
	data := NeoJSONReader fromString: '"foo"'.
	schema validate: data.
	"number is invalid"
	data := NeoJSONReader fromString: '123'.
	self should: [ schema validate: data ] raise: JSONSchemaError