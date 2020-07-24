as yet unclassified
testContainsKeywordWithConstKeyword
	"contains keyword with const keyword"

	| schema data |
	schema := JSONSchema fromString: '{"contains":{"const":5}}'.
	"array with item 5 is valid"
	data := NeoJSONReader fromString: '[3,4,5]'.
	schema validate: data.
	"array with two items 5 is valid"
	data := NeoJSONReader fromString: '[3,4,5,5]'.
	schema validate: data.
	"array without item 5 is invalid"
	data := NeoJSONReader fromString: '[1,2,3,4]'.
	self should: [ schema validate: data ] raise: JSONSchemaError