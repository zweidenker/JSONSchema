as yet unclassified
testIgnoreIfWithoutThenOrElse
	"ignore if without then or else"

	| schema data |
	schema := JSONSchema fromString: '{"if":{"const":0}}'.
	"valid when valid against lone if"
	data := NeoJSONReader fromString: '0'.
	schema validate: data.
	"valid when invalid against lone if"
	data := NeoJSONReader fromString: '"hello"'.
	schema validate: data