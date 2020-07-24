as yet unclassified
testAllOfWithTwoEmptySchemas
	"allOf with two empty schemas"

	| schema data |
	schema := JSONSchema fromString: '{"allOf":[{},{}]}'.
	"any data is valid"
	data := NeoJSONReader fromString: '1'.
	schema validate: data