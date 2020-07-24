as yet unclassified
testIntegerComparison
	"integer comparison"

	| schema data |
	schema := JSONSchema fromString: '{"minimum":-18446744073709551615}'.
	"comparison works for very negative numbers"
	data := NeoJSONReader fromString: '-18446744073709551600'.
	schema validate: data