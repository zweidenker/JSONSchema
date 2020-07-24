as yet unclassified
testOneOfWithMissingOptionalProperty
	"oneOf with missing optional property"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"oneOf":[{"properties":{"bar":true,"baz":true},"required":["bar"]},{"properties":{"foo":true},"required":["foo"]}]}'.
	"first oneOf valid"
	data := NeoJSONReader fromString: '{"bar":8}'.
	schema validate: data.
	"second oneOf valid"
	data := NeoJSONReader fromString: '{"foo":"foo"}'.
	schema validate: data.
	"both oneOf valid"
	data := NeoJSONReader fromString: '{"foo":"foo","bar":8}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"neither oneOf valid"
	data := NeoJSONReader fromString: '{"baz":"quux"}'.
	self should: [ schema validate: data ] raise: JSONSchemaError