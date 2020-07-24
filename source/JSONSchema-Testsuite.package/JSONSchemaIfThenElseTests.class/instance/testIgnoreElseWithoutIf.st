as yet unclassified
testIgnoreElseWithoutIf
	"ignore else without if"

	| schema data |
	schema := JSONSchema fromString: '{"else":{"const":0}}'.
	"valid when valid against lone else"
	data := NeoJSONReader fromString: '0'.
	schema validate: data.
	"valid when invalid against lone else"
	data := NeoJSONReader fromString: '"hello"'.
	schema validate: data