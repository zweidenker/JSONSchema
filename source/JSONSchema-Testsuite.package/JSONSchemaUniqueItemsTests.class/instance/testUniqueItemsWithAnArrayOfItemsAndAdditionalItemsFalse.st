as yet unclassified
testUniqueItemsWithAnArrayOfItemsAndAdditionalItemsFalse
	"uniqueItems with an array of items and additionalItems=false"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"items":[{"type":"boolean"},{"type":"boolean"}],"uniqueItems":true,"additionalItems":false}'.
	"[false, true] from items array is valid"
	data := NeoJSONReader fromString: '[false,true]'.
	schema validate: data.
	"[true, false] from items array is valid"
	data := NeoJSONReader fromString: '[true,false]'.
	schema validate: data.
	"[false, false] from items array is not valid"
	data := NeoJSONReader fromString: '[false,false]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"[true, true] from items array is not valid"
	data := NeoJSONReader fromString: '[true,true]'.
	self should: [ schema validate: data ] raise: JSONSchemaError.
	"extra items are invalid even if unique"
	data := NeoJSONReader fromString: '[false,true,null]'.
	self should: [ schema validate: data ] raise: JSONSchemaError