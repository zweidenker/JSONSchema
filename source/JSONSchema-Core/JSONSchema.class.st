Class {
	#name : 'JSONSchema',
	#superclass : 'Object',
	#instVars : [
		'title',
		'description',
		'constraints'
	],
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'accessing' }
JSONSchema class >> any [
	^ (self typeNamed: 'any') new
]

{ #category : 'accessing' }
JSONSchema class >> boolean [
	^ (self typeNamed: 'boolean') new
]

{ #category : 'accessing' }
JSONSchema class >> date [
	^ self stringWithFormat: #'date'
]

{ #category : 'accessing' }
JSONSchema class >> dateAndTime [
	^ self stringWithFormat: #'date-time'
]

{ #category : 'as yet unclassified' }
JSONSchema class >> enum: aCollection [
	^ self string 
		enum: aCollection;
		yourself
]

{ #category : 'instance creation' }
JSONSchema class >> fromString: aString [
	"convenience method to read a schema from a string. A string is always a 
	JSON schema document and we retrieved the schema from this document"
	^ (JSONSchemaDocument fromString: aString) asJSONSchema
]

{ #category : 'accessing' }
JSONSchema class >> integer [
	^ (self typeNamed: 'integer') new
]

{ #category : 'accessing' }
JSONSchema class >> integerWithFormat: formatString [
	^ self integer 
		formatString: formatString 
]

{ #category : 'testing' }
JSONSchema class >> isAbstract [
	^ self = JSONSchema 
]

{ #category : 'accessing' }
JSONSchema class >> neoJsonMapping: mapper [
	mapper for: self do: [ :mapping |
		mapping mapAccessor: #reference to: '$ref'.
		mapping mapInstVars: #( title description).
		mapping mapAccessor: #typeString mutator: #typeString: to: #type  ].

]

{ #category : 'accessing' }
JSONSchema class >> number [
	^ (self typeNamed: 'number') new
]

{ #category : 'accessing' }
JSONSchema class >> numberWithFormat: formatString [
	^ self number 
		formatString: formatString 
]

{ #category : 'accessing' }
JSONSchema class >> string [
	^ (self typeNamed: 'string') new
]

{ #category : 'accessing' }
JSONSchema class >> stringWithFormat: formatString [
	^ self string 
		formatString: formatString 
]

{ #category : 'instance creation' }
JSONSchema class >> typeName [
	^ 'composed'
]

{ #category : 'instance creation' }
JSONSchema class >> typeNamed: aString [ 
	^ (self allSubclasses reject: #isAbstract)
		detect: [ :each | each typeName = aString ]
		ifFound: [ :typeClass | typeClass ]
		ifNone: [ Error signal: 'type with name ', aString asString, ' not found' ]
]

{ #category : 'adding' }
JSONSchema >> addConstraint: aConstraint [ 
	self constraints add: aConstraint 
]

{ #category : 'conversion' }
JSONSchema >> asJSONSchema [
	^ self 
]

{ #category : 'accessing' }
JSONSchema >> constraints [
	^ constraints ifNil: [ 
		constraints := OrderedCollection new ]
]

{ #category : 'accessing' }
JSONSchema >> description [
	^ description
]

{ #category : 'accessing' }
JSONSchema >> description: anObject [
	description := anObject
]

{ #category : 'initialization' }
JSONSchema >> initializeFromDefinition: aDefinition [
	JSONSchemaConstraint
		subclassesDo: [ :constraintClass | 
			| constraint |
			constraint := constraintClass new
				initializeFromDefinition: aDefinition.
			constraint validate
				ifTrue: [ self addConstraint: constraint ] ]
]

{ #category : 'conversion' }
JSONSchema >> jsonString [
	^ NeoJSONWriter toString: self
]

{ #category : 'conversion' }
JSONSchema >> jsonStringPretty [
	^ NeoJSONWriter toStringPretty: self
]

{ #category : 'as yet unclassified' }
JSONSchema >> neoJsonOn: jsonWriter [

	jsonWriter writeMapStreamingDo: [ :jsonMapWriter |
		self schemaProperties do: [ :assoc | | value |
			value := self perform: assoc key.
			(value = assoc value) ifFalse: [  
				jsonMapWriter writeKey: assoc key value: value] ].
		self writePropertiesOn: jsonMapWriter ]

]

{ #category : 'instance creation' }
JSONSchema >> readFrom: aStream [
	^ self readUsing: (NeoJSONReader on: aStream)
]

{ #category : 'instance creation' }
JSONSchema >> readFrom: aStream object: object [
	^ self 
		readUsing: (NeoJSONReader on: aStream)
		object: object
]

{ #category : 'instance creation' }
JSONSchema >> readString: aString [
	^ self readFrom: aString readStream
]

{ #category : 'instance creation' }
JSONSchema >> readUsing: aReader [
	self subclassResponsibility 
]

{ #category : 'accessing' }
JSONSchema >> reference [ 
	^ nil
]

{ #category : 'accessing' }
JSONSchema >> schemaProperties [
	^ {  
		#type -> nil.
		#title -> nil.
		#description -> nil }
]

{ #category : 'accessing' }
JSONSchema >> title [
	^ title
]

{ #category : 'accessing' }
JSONSchema >> title: anObject [
	title := anObject
]

{ #category : 'accessing' }
JSONSchema >> type [
	^ self typeString
]

{ #category : 'as yet unclassified' }
JSONSchema >> typeString [
	^ self class typeName
]

{ #category : 'validation' }
JSONSchema >> validate: anObject [
	self validateType: anObject.
	self constraints
		select: [ :constraint | constraint validateType: anObject ]
		thenDo: [ :constraint | constraint validate: anObject ]
]

{ #category : 'validation' }
JSONSchema >> validateType: anObject [
]

{ #category : 'writing' }
JSONSchema >> writePropertiesOn: mapWriter [
	"mapWriter writeKey: 'type' value: self typeString."
	constraints ifNil: [ ^ self ].
	constraints do: [ :constraint |
			constraint definitionProperties do: [ :property | | value |
				value := constraint perform: property asSymbol.
				value ifNotNil: [  
					mapWriter writeKey: property value: value ]  ]  ]
		
]
