as yet unclassified
testUniqueItemsFalseWithAnArrayOfItemsAndAdditionalItemsFalse
	"uniqueItems=false with an array of items and additionalItems=false"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"items":[{"type":"boolean"},{"type":"boolean"}],"uniqueItems":false,"additionalItems":false}'.
	"[false, true] from items array is valid"
	data := NeoJSONReader fromString: '[false,true]'.
	schema validate: data.
	"[true, false] from items array is valid"
	data := NeoJSONReader fromString: '[true,false]'.
	schema validate: data.
	"[false, false] from items array is valid"
	data := NeoJSONReader fromString: '[false,false]'.
	schema validate: data.
	"[true, true] from items array is valid"
	data := NeoJSONReader fromString: '[true,true]'.
	schema validate: data.
	"extra items are invalid even if unique"
	data := NeoJSONReader fromString: '[false,true,null]'.
	self should: [ schema validate: data ] raise: JSONSchemaError