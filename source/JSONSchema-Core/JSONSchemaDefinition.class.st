Class {
	#name : 'JSONSchemaDefinition',
	#superclass : 'Object',
	#instVars : [
		'title',
		'description',
		'allOf',
		'schemaClass',
		'properties',
		'required',
		'items',
		'reference',
		'format',
		'minimum',
		'maximum',
		'exclusiveMinimum',
		'exclusiveMaximum',
		'enum',
		'additionalProperties',
		'multipleOf',
		'uniqueItems',
		'minLength',
		'maxLength',
		'minItems',
		'maxItems',
		'minProperties',
		'maxProperties',
		'booleanValue',
		'oneOf',
		'anyOf',
		'not',
		'pattern'
	],
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'instance creation' }
JSONSchemaDefinition class >> fromString: aString [
	^ self readFrom: aString readStream 
]

{ #category : 'accessing' }
JSONSchemaDefinition class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping |
		mapping mapAccessor: #reference to: '$ref'.
		mapping mapInstVars: #( title ).
		mapping mapAccessors: #( required description enum pattern ).
		mapping mapAccessor: #formatString mutator: #formatString: to: #format.
		(mapping mapAccessor: #properties) valueSchema: #PropertiesDictionary.
		(mapping mapAccessor: #items) valueSchema: #SingleSchema.
		(mapping mapAccessor: #not) valueSchema: #SingleSchema.
		mapping mapAccessors: #( additionalProperties multipleOf maximum exclusiveMaximum minimum exclusiveMinimum maxLength minLength maxItems minItems uniqueItems maxProperties minProperties  ).
		(mapping mapAccessor: #allOf) valueSchema: #SchemaList.
		(mapping mapAccessor: #anyOf) valueSchema: #SchemaList.
		(mapping mapAccessor: #oneOf) valueSchema: #SchemaList.
		mapping mapAccessor: #typeString mutator: #typeString: to: #type.
		 ].
	mapper for: #PropertiesDictionary customDo: [ :mapping |
		"Same boolean-tolerant reading as #SchemaList/#SingleSchema below - a property's
		schema can be a bare true/false, not just an object (e.g. properties:{foo:false})."
		mapping mapWithValueSchema: JSONSchemaDefinition.
		mapping reader: [ :jsonReader | | map |
			map := jsonReader mapClass new.
			jsonReader parseMapKeysDo: [ :key | | matched value entry |
				matched := false.
				value := nil.
				jsonReader parseConstantDo: [ :v | matched := true. value := v ].
				entry := (matched and: [ value isKindOf: Boolean ])
					ifTrue: [ JSONSchemaDefinition new booleanValue: value; yourself ]
					ifFalse: [ jsonReader nextAs: JSONSchemaDefinition ].
				map at: key put: entry ].
			map ] ].
	mapper for: #SchemaList customDo: [ :mapping |
		"allOf/anyOf/oneOf elements can each be a bare true/false, not just an object
		(e.g. allOf:[false]) - #listOfElementSchema: keeps the writer, we only replace
		the reader with a boolean-tolerant version."
		mapping listOfElementSchema: JSONSchemaDefinition.
		mapping reader: [ :jsonReader |
			jsonReader listClass streamContents: [ :stream |
				jsonReader parseListDo: [ | matched value element |
					matched := false.
					value := nil.
					jsonReader parseConstantDo: [ :v | matched := true. value := v ].
					element := (matched and: [ value isKindOf: Boolean ])
						ifTrue: [ JSONSchemaDefinition new booleanValue: value; yourself ]
						ifFalse: [ jsonReader nextAs: JSONSchemaDefinition ].
					stream nextPut: element ] ] ] ].
	mapper for: #SingleSchema customDo: [ :mapping |
		"A single nested schema slot (items, not) that can be a bare
		true/false, not just an object (e.g. items:false, not:true)."
		mapping reader: [ :jsonReader | | matched value |
			matched := false.
			value := nil.
			jsonReader parseConstantDo: [ :v | matched := true. value := v ].
			(matched and: [ value isKindOf: Boolean ])
				ifTrue: [ JSONSchemaDefinition new booleanValue: value; yourself ]
				ifFalse: [ jsonReader nextAs: JSONSchemaDefinition ] ] ]
]

{ #category : 'instance creation' }
JSONSchemaDefinition class >> readFrom: stream [
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
]

{ #category : 'visiting' }
JSONSchemaDefinition >> acceptJSONSchema: aVisitor [ 
	^ aVisitor visitSchemaSpec: self 
]

{ #category : 'accessing' }
JSONSchemaDefinition >> additionalProperties: anObject [
	additionalProperties := (anObject isNil | (anObject isKindOf: Boolean)) 
		ifTrue: [ JSONSchemaAnyObject new ]
		ifFalse: [ anObject asJSONSchema ]
]

{ #category : 'accessing' }
JSONSchemaDefinition >> allOf [
	^ allOf
]

{ #category : 'accessing' }
JSONSchemaDefinition >> allOf: aCollection [
	allOf := aCollection
]

{ #category : 'accessing' }
JSONSchemaDefinition >> asJSONSchema [
	"^ schemaClass newFromSchemaSpec: self "
	booleanValue ifNotNil: [
		^ booleanValue
			ifTrue: [ JSONSchemaAnyObject new ]
			ifFalse: [ JSONSchemaBooleanFalse new ] ].
	^ (self as: (schemaClass ifNil: [ JSONSchemaAnyObject ]))
		initializeFromDefinition: self
]

{ #category : 'accessing' }
JSONSchemaDefinition >> booleanValue [
	^ booleanValue
]

{ #category : 'accessing' }
JSONSchemaDefinition >> booleanValue: aBoolean [
	booleanValue := aBoolean
]

{ #category : 'accessing' }
JSONSchemaDefinition >> description [
	^ description
]

{ #category : 'accessing' }
JSONSchemaDefinition >> description: aString [ 
	description := aString
]

{ #category : 'accessing' }
JSONSchemaDefinition >> enum [
	^ enum
]

{ #category : 'accessing' }
JSONSchemaDefinition >> enum: aCollection [ 
	enum := aCollection
]

{ #category : 'accessing' }
JSONSchemaDefinition >> exclusiveMaximum [
	^ exclusiveMaximum
]

{ #category : 'accessing' }
JSONSchemaDefinition >> exclusiveMaximum: anInteger [ 
	exclusiveMaximum := anInteger
]

{ #category : 'accessing' }
JSONSchemaDefinition >> exclusiveMinimum [
	^ exclusiveMinimum
]

{ #category : 'accessing' }
JSONSchemaDefinition >> exclusiveMinimum: anInteger [ 
	exclusiveMinimum := anInteger
]

{ #category : 'accessing' }
JSONSchemaDefinition >> format [
	^ format
]

{ #category : 'converstion' }
JSONSchemaDefinition >> format: value [
	"If a format is specified convert the value. Otherwise leave it untouched"
	^ format 
		ifNotNil: [ format read: value ]
		ifNil: [ value ]
]

{ #category : 'accessing' }
JSONSchemaDefinition >> formatString [
	^ format 
		ifNotNil: [ format formatName ]
		
]

{ #category : 'accessing' }
JSONSchemaDefinition >> formatString: aString [ 
	(aString = 'string') ifTrue: [ ^ self ].
	format := JSONFormat formatNamed: aString
]

{ #category : 'initialization' }
JSONSchemaDefinition >> initialize [
	super initialize.
	additionalProperties := true
]

{ #category : 'testing' }
JSONSchemaDefinition >> isReference [
	^ reference notNil
]

{ #category : 'accessing' }
JSONSchemaDefinition >> items [
	^ items
]

{ #category : 'accessing' }
JSONSchemaDefinition >> items: aString [ 
	items := aString
]

{ #category : 'accessing' }
JSONSchemaDefinition >> maxItems [
	^ maxItems
]

{ #category : 'accessing' }
JSONSchemaDefinition >> maxItems: anInteger [
	maxItems := anInteger
]

{ #category : 'accessing' }
JSONSchemaDefinition >> maxLength [
	^ maxLength
]

{ #category : 'accessing' }
JSONSchemaDefinition >> maxLength: anInteger [
	maxLength := anInteger
]

{ #category : 'accessing' }
JSONSchemaDefinition >> maxProperties [
	^ maxProperties
]

{ #category : 'accessing' }
JSONSchemaDefinition >> maxProperties: anInteger [
	maxProperties := anInteger
]

{ #category : 'accessing' }
JSONSchemaDefinition >> maximum [
	^ maximum
]

{ #category : 'accessing' }
JSONSchemaDefinition >> maximum: anInteger [ 
	maximum := anInteger 
]

{ #category : 'accessing' }
JSONSchemaDefinition >> minItems [
	^ minItems
]

{ #category : 'accessing' }
JSONSchemaDefinition >> minItems: anInteger [
	minItems := anInteger
]

{ #category : 'accessing' }
JSONSchemaDefinition >> minLength [
	^ minLength
]

{ #category : 'accessing' }
JSONSchemaDefinition >> minLength: anInteger [
	minLength := anInteger
]

{ #category : 'accessing' }
JSONSchemaDefinition >> minProperties [
	^ minProperties
]

{ #category : 'accessing' }
JSONSchemaDefinition >> minProperties: anInteger [
	minProperties := anInteger
]

{ #category : 'accessing' }
JSONSchemaDefinition >> minimum [
	^ minimum
]

{ #category : 'accessing' }
JSONSchemaDefinition >> minimum: anInteger [ 
	minimum := anInteger
]

{ #category : 'accessing' }
JSONSchemaDefinition >> multipleOf [
	^ multipleOf
]

{ #category : 'accessing' }
JSONSchemaDefinition >> multipleOf: anInteger [
	multipleOf := anInteger
]

{ #category : 'accessing' }
JSONSchemaDefinition >> not [
	^ not
]

{ #category : 'accessing' }
JSONSchemaDefinition >> not: aDefinition [
	not := aDefinition
]

{ #category : 'accessing' }
JSONSchemaDefinition >> oneOf [
	^ oneOf
]

{ #category : 'accessing' }
JSONSchemaDefinition >> oneOf: aCollection [
	oneOf := aCollection
]

{ #category : 'accessing' }
JSONSchemaDefinition >> anyOf [
	^ anyOf
]

{ #category : 'accessing' }
JSONSchemaDefinition >> anyOf: aCollection [
	anyOf := aCollection
]

{ #category : 'accessing' }
JSONSchemaDefinition >> pattern [
	^ pattern
]

{ #category : 'accessing' }
JSONSchemaDefinition >> pattern: aString [
	pattern := aString
]

{ #category : 'accessing' }
JSONSchemaDefinition >> properties [
	^ properties
]

{ #category : 'accessing' }
JSONSchemaDefinition >> properties: anObject [
	self schemaClass: JSONSchemaObject.
	properties := anObject
]

{ #category : 'accessing' }
JSONSchemaDefinition >> reference [
	^ reference
]

{ #category : 'accessing' }
JSONSchemaDefinition >> reference: aString [ 
	reference := JSONSchemaReference path: aString
]

{ #category : 'accessing' }
JSONSchemaDefinition >> required [
	^ required
]

{ #category : 'accessing' }
JSONSchemaDefinition >> required: anObject [
	required := anObject
]

{ #category : 'accessing' }
JSONSchemaDefinition >> schemaClass [
	^ schemaClass
]

{ #category : 'accessing' }
JSONSchemaDefinition >> schemaClass: aClass [ 
	(schemaClass isNil | (schemaClass = aClass)) ifFalse: [
		Error signal: 'schema class is incompatible' ].
	schemaClass := aClass
]

{ #category : 'accessing' }
JSONSchemaDefinition >> title [
	^ title
]

{ #category : 'accessing' }
JSONSchemaDefinition >> title: anObject [
	title := anObject
]

{ #category : 'accessing' }
JSONSchemaDefinition >> typeString: aString [ 
	schemaClass := JSONSchema typeNamed: aString
]

{ #category : 'accessing' }
JSONSchemaDefinition >> uniqueItems [
	^ uniqueItems
]

{ #category : 'accessing' }
JSONSchemaDefinition >> uniqueItems: aBoolean [
	uniqueItems := aBoolean
]
