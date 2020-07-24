as yet unclassified
testString
	"string"

	| schema data |
	schema := JSONSchema fromString: '{"type":"string"}'.
	"a bignum is not a string"
	data := NeoJSONReader
		fromString: '98249283749234923498293171823948729348710298301928331'.
	self should: [ schema validate: data ] raise: JSONSchemaError