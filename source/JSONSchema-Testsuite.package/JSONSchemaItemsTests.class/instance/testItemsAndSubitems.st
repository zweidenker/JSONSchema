as yet unclassified
testItemsAndSubitems
	"items and subitems"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"definitions":{"item":{"additionalItems":false,"items":[{"$ref":"#/definitions/sub-item"},{"$ref":"#/definitions/sub-item"}],"type":"array"},"sub-item":{"required":["foo"],"type":"object"}},"additionalItems":false,"items":[{"$ref":"#/definitions/item"},{"$ref":"#/definitions/item"},{"$ref":"#/definitions/item"}],"type":"array"}'.
	"valid items"
	data := NeoJSONReader
		fromString:
			'[[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}]]'.
	schema validate: data.
	"too many items"
	data := NeoJSONReader
		fromString:
			'[[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}]]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"too many sub-items"
	data := NeoJSONReader
		fromString:
			'[[{"foo":null},{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}]]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"wrong item"
	data := NeoJSONReader
		fromString:
			'[{"foo":null},[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}]]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"wrong sub-item"
	data := NeoJSONReader
		fromString:
			'[[{},{"foo":null}],[{"foo":null},{"foo":null}],[{"foo":null},{"foo":null}]]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"fewer items is valid"
	data := NeoJSONReader fromString: '[[{"foo":null}],[{"foo":null}]]'.
	schema validate: data