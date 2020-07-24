as yet unclassified
testNestedItems
	"nested items"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"items":{"items":{"items":{"items":{"type":"number"},"type":"array"},"type":"array"},"type":"array"},"type":"array"}'.
	"valid nested array"
	data := NeoJSONReader
		fromString: '[[[[1]],[[2],[3]]],[[[4],[5],[6]]]]'.
	schema validate: data.
	"nested array with invalid type"
	data := NeoJSONReader
		fromString: '[[[["1"]],[[2],[3]]],[[[4],[5],[6]]]]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"not deep enough"
	data := NeoJSONReader fromString: '[[[1],[2],[3]],[[4],[5],[6]]]'.
	self should: [ schema validate: data ] raise: JSONSchemaError