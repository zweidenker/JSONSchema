as yet unclassified
testBaseURIChange
	"base URI change"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"items":{"items":{"$ref":"folderInteger.json"},"$id":"folder/"},"$id":"http://localhost:1234/"}'.
	"base URI change ref valid"
	data := NeoJSONReader fromString: '[[1]]'.
	schema validate: data.
	"base URI change ref invalid"
	data := NeoJSONReader fromString: '[["a"]]'.
	self should: [ schema validate: data ] raise: JSONSchemaError