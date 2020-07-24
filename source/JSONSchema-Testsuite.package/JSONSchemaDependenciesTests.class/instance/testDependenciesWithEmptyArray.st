as yet unclassified
testDependenciesWithEmptyArray
	"dependencies with empty array"

	| schema data |
	schema := JSONSchema fromString: '{"dependencies":{"bar":[]}}'.
	"empty object"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data.
	"object with one property"
	data := NeoJSONReader fromString: '{"bar":2}'.
	schema validate: data.
	"non-object is valid"
	data := NeoJSONReader fromString: '1'.
	schema validate: data