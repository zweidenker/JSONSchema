as yet unclassified
testIgnoreThenWithoutIf
	"ignore then without if"

	| schema data |
	schema := JSONSchema fromString: '{"then":{"const":0}}'.
	"valid when valid against lone then"
	data := NeoJSONReader fromString: '0'.
	schema validate: data.
	"valid when invalid against lone then"
	data := NeoJSONReader fromString: '"hello"'.
	schema validate: data