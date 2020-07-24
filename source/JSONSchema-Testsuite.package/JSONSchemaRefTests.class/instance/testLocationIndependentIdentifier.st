as yet unclassified
testLocationIndependentIdentifier
	"Location-independent identifier"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"allOf":[{"$ref":"#foo"}],"definitions":{"A":{"$id":"#foo","type":"integer"}}}'.
	"match"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"mismatch"
	data := NeoJSONReader fromString: '"a"'.
	self should: [ schema validate: data ] raise: JSONSchemaError