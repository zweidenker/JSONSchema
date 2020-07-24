as yet unclassified
testAdditionalItemsAsFalseWithoutItems
	"additionalItems as false without items"

	| schema data |
	schema := JSONSchema fromString: '{"additionalItems":false}'.
	"items defaults to empty schema so everything is valid"
	data := NeoJSONReader fromString: '[1,2,3,4,5]'.
	schema validate: data.
	"ignores non-arrays"
	data := NeoJSONReader fromString: '{"foo":"bar"}'.
	schema validate: data