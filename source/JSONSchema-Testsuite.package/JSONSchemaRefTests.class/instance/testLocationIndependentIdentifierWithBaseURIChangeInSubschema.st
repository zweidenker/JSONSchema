as yet unclassified
testLocationIndependentIdentifierWithBaseURIChangeInSubschema
	"Location-independent identifier with base URI change in subschema"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"allOf":[{"$ref":"http://localhost:1234/nested.json#foo"}],"definitions":{"A":{"definitions":{"B":{"$id":"#foo","type":"integer"}},"$id":"nested.json"}},"$id":"http://localhost:1234/root"}'.
	"match"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"mismatch"
	data := NeoJSONReader fromString: '"a"'.
	self should: [ schema validate: data ] raise: JSONSchemaError