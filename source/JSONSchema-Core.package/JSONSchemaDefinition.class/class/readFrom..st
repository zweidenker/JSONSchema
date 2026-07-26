instance creation
readFrom: stream
	"A JSON Schema document is either a JSON object (the common case, read via NeoJSON's
	regular mapped-object reading) or a bare boolean literal (true = always valid, false =
	never valid, see JSONSchemaBooleanFalse). #parseConstantDo:'s own return value is not
	reliable (see the identical pattern in the SchemaList/PropertiesDictionary/SingleSchema
	readers below) - the side effects on matched/value are what we rely on."
	| reader matched value |
	reader := NeoJSONReader on: stream.
	matched := false.
	value := nil.
	reader parseConstantDo: [ :v | matched := true. value := v ].
	(matched and: [ value isKindOf: Boolean ]) ifTrue: [
		^ self new booleanValue: value; yourself ].
	matched ifTrue: [ ^ self error: 'null is not a valid schema' ].
	^ reader nextAs: self