as yet unclassified
testRemoteRefContainingRefsItself
	"remote ref, containing refs itself"

	| schema data |
	schema := JSONSchema
		fromString: '{"$ref":"http://json-schema.org/draft-07/schema#"}'.
	"remote ref valid"
	data := NeoJSONReader fromString: '{"minLength":1}'.
	schema validate: data.
	"remote ref invalid"
	data := NeoJSONReader fromString: '{"minLength":-1}'.
	self should: [ schema validate: data ] raise: JSONSchemaError