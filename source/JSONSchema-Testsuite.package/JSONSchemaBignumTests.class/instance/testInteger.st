as yet unclassified
testInteger
	"integer"

	| schema data |
	schema := JSONSchema fromString: '{"type":"integer"}'.
	"a negative bignum is an integer"
	data := NeoJSONReader
		fromString: '-12345678910111213141516171819202122232425262728293031'.
	schema validate: data