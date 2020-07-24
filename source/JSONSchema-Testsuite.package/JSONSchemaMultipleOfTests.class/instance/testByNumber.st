as yet unclassified
testByNumber
	"by number"

	| schema data |
	schema := JSONSchema fromString: '{"multipleOf":1.5}'.
	"zero is multiple of anything"
	data := NeoJSONReader fromString: '0'.
	schema validate: data.
	"4.5 is multiple of 1.5"
	data := NeoJSONReader fromString: '4.5'.
	schema validate: data.
	"35 is not multiple of 1.5"
	data := NeoJSONReader fromString: '35'.
	self should: [ schema validate: data ] raise: JSONSchemaError