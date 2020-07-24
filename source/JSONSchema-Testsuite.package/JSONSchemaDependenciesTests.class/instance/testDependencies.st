as yet unclassified
testDependencies
	"dependencies"

	| schema data |
	schema := JSONSchema fromString: '{"dependencies":{"bar":["foo"]}}'.
	"neither"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data.
	"nondependant"
	data := NeoJSONReader fromString: '{"foo":1}'.
	schema validate: data.
	"with dependency"
	data := NeoJSONReader fromString: '{"foo":1,"bar":2}'.
	schema validate: data.
	"missing dependency"
	data := NeoJSONReader fromString: '{"bar":2}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"ignores arrays"
	data := NeoJSONReader fromString: '["bar"]'.
	schema validate: data.
	"ignores strings"
	data := NeoJSONReader fromString: '"foobar"'.
	schema validate: data.
	"ignores other non-objects"
	data := NeoJSONReader fromString: '12'.
	schema validate: data