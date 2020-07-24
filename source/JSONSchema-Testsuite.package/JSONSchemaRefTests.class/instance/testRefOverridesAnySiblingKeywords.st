as yet unclassified
testRefOverridesAnySiblingKeywords
	"ref overrides any sibling keywords"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"definitions":{"reffed":{"type":"array"}},"properties":{"foo":{"$ref":"#/definitions/reffed","maxItems":2}}}'.
	"ref valid"
	data := NeoJSONReader fromString: '{"foo":[]}'.
	schema validate: data.
	"ref valid, maxItems ignored"
	data := NeoJSONReader fromString: '{"foo":[1,2,3]}'.
	schema validate: data.
	"ref invalid"
	data := NeoJSONReader fromString: '{"foo":"string"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError