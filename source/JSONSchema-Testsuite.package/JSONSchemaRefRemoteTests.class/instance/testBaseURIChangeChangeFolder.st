as yet unclassified
testBaseURIChangeChangeFolder
	"base URI change - change folder"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"definitions":{"baz":{"items":{"$ref":"folderInteger.json"},"$id":"folder/","type":"array"}},"properties":{"list":{"$ref":"#/definitions/baz"}},"$id":"http://localhost:1234/scope_change_defs1.json","type":"object"}'.
	"number is valid"
	data := NeoJSONReader fromString: '{"list":[1]}'.
	schema validate: data.
	"string is invalid"
	data := NeoJSONReader fromString: '{"list":["a"]}'.
	self should: [ schema validate: data ] raise: JSONSchemaError