as yet unclassified
testBaseURIChangeChangeFolderInSubschema
	"base URI change - change folder in subschema"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"definitions":{"baz":{"definitions":{"bar":{"items":{"$ref":"folderInteger.json"},"type":"array"}},"$id":"folder/"}},"properties":{"list":{"$ref":"#/definitions/baz/definitions/bar"}},"$id":"http://localhost:1234/scope_change_defs2.json","type":"object"}'.
	"number is valid"
	data := NeoJSONReader fromString: '{"list":[1]}'.
	schema validate: data.
	"string is invalid"
	data := NeoJSONReader fromString: '{"list":["a"]}'.
	self should: [ schema validate: data ] raise: JSONSchemaError