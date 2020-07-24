as yet unclassified
testNumber
	"number"

	| schema data |
	schema := JSONSchema fromString: '{"type":"number"}'.
	"a negative bignum is a number"
	data := NeoJSONReader
		fromString: '-98249283749234923498293171823948729348710298301928331'.
	schema validate: data