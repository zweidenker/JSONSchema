as yet unclassified
testUniqueItemsFalseWithAnArrayOfItems
	"uniqueItems=false with an array of items"

	| schema data |
	schema := JSONSchema
		fromString:
			'{"items":[{"type":"boolean"},{"type":"boolean"}],"uniqueItems":false}'.
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
	"unique array extended from [false, true] is valid"
	data := NeoJSONReader fromString: '[false,true,"foo","bar"]'.
	schema validate: data.
	"unique array extended from [true, false] is valid"
	data := NeoJSONReader fromString: '[true,false,"foo","bar"]'.
	schema validate: data.
	"non-unique array extended from [false, true] is valid"
	data := NeoJSONReader fromString: '[false,true,"foo","foo"]'.
	schema validate: data.
	"non-unique array extended from [true, false] is valid"
	data := NeoJSONReader fromString: '[true,false,"foo","foo"]'.
	schema validate: data