as yet unclassified
testLocationIndependentIdentifierWithAbsoluteURI
	"Location-independent identifier with absolute URI"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"allOf":[{"$ref":"http://localhost:1234/bar#foo"}],"definitions":{"A":{"$id":"http://localhost:1234/bar#foo","type":"integer"}}}'.
	"match"
	data := NeoJSONReader fromString: '1'.
	schema validate: data.
	"mismatch"
	data := NeoJSONReader fromString: '"a"'.
	self should: [ schema validate: data ] raise: JSONSchemaError