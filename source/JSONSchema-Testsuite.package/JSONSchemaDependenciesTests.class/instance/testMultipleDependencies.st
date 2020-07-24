as yet unclassified
testMultipleDependencies
	"multiple dependencies"

	| schema data |
	schema := JSONSchema
		fromString: '{"dependencies":{"quux":["foo","bar"]}}'.
	"neither"
	data := NeoJSONReader fromString: '{}'.
	schema validate: data.
	"nondependants"
	data := NeoJSONReader fromString: '{"foo":1,"bar":2}'.
	schema validate: data.
	"with dependencies"
	data := NeoJSONReader fromString: '{"quux":3,"foo":1,"bar":2}'.
	schema validate: data.
	"missing dependency"
	data := NeoJSONReader fromString: '{"quux":2,"foo":1}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"missing other dependency"
	data := NeoJSONReader fromString: '{"quux":2,"bar":1}'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"missing both dependencies"
	data := NeoJSONReader fromString: '{"quux":1}'.
	self should: [ schema validate: data ] raise: JSONSchemaError