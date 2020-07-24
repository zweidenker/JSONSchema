as yet unclassified
testRegexesAreNotAnchoredByDefaultAndAreCaseSensitive
	"regexes are not anchored by default and are case sensitive"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"patternProperties":{"[0-9]{2,}":{"type":"boolean"},"X_":{"type":"string"}}}'.
	"non recognized members are ignored"
	data := NeoJSONReader fromString: '{"answer 1":"42"}'.
	schema validate: data.
	"recognized members are accounted for"
	data := NeoJSONReader fromString: '{"a31b":null}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"regexes are case sensitive"
	data := NeoJSONReader fromString: '{"a_x_3":3}'.
	schema validate: data.
	"regexes are case sensitive, 2"
	data := NeoJSONReader fromString: '{"a_X_3":3}'.
	self should: [ schema validate: data ] raise: JSONSchemaError