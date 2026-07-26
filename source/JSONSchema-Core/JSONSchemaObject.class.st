Class {
	#name : 'JSONSchemaObject',
	#superclass : 'JSONSchemaBasicObject',
	#instVars : [
		'properties',
		'required',
		'additionalProperties',
		'instanceClass'
	],
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'accessing' }
JSONSchemaObject class >> neoJsonMapping: mapper [
	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		(mapping mapAccessor: #properties)  ].
	
	mapper for: #PropertiesDictionary customDo: [ :mapping |
		mapping mapWithValueSchema: JSONSchemaDefinition  ].

]

{ #category : 'instance creation' }
JSONSchemaObject class >> typeName [
	^ 'object'
]

{ #category : 'visiting' }
JSONSchemaObject >> acceptJSONSchema: aVisitor [ 
	^ aVisitor visitTypeObject: self
]

{ #category : 'accessing' }
JSONSchemaObject >> additionalProperties [
	^ additionalProperties
]

{ #category : 'accessing' }
JSONSchemaObject >> additionalProperties: anObject [
	additionalProperties := anObject
]

{ #category : 'as yet unclassified' }
JSONSchemaObject >> checkRequiredKeys: keys [ 
	| containedKeys |
	required ifNotNil: [  
		containedKeys := keys intersection: properties keys.
		(containedKeys includesAll: required) ifFalse: [ 
			 JSONTypeError signal: 'object is missing required properties ', ($, join: (required difference: containedKeys)) ] ]
]

{ #category : 'accessing' }
JSONSchemaObject >> defaultInstanceClass [
	^ NeoJSONObject 
]

{ #category : 'initialization' }
JSONSchemaObject >> initialize [ 
	super initialize.
	additionalProperties := true
]

{ #category : 'accessing' }
JSONSchemaObject >> instanceClass [
	^ instanceClass ifNil: [ 
		self defaultInstanceClass ]
]

{ #category : 'accessing' }
JSONSchemaObject >> instanceClass: aClass [ 
	instanceClass := aClass
]

{ #category : 'testing' }
JSONSchemaObject >> isAnyObject [
	self flag: #todo.
	"Should properties be nil???"
	^ properties isNil or: [ properties isEmpty ]
]

{ #category : 'testing' }
JSONSchemaObject >> isRequired: aString [ 
	^ required includes: aString
]

{ #category : 'accessing' }
JSONSchemaObject >> neededKeys [
	^ required 
		ifNotNil: [ required asOrderedCollection copy ]
		ifNil: [ OrderedCollection new ]
]

{ #category : 'instance creation' }
JSONSchemaObject >> newInstance [
	^ self instanceClass new
]

{ #category : 'accessing' }
JSONSchemaObject >> properties [ 
	^ properties "ifNil: [ 
		properties := Dictionary new ]"
]

{ #category : 'accessing' }
JSONSchemaObject >> properties: aDictionary [
	properties := aDictionary
]

{ #category : 'as yet unclassified' }
JSONSchemaObject >> propertyAt: aString [ 
	^ properties at: aString
]

{ #category : 'accessing' }
JSONSchemaObject >> propertyAt: key put: schema [
	^ properties 
		at: key 
		put: schema
]

{ #category : 'meta-object-protocol' }
JSONSchemaObject >> read: aDictionary [
	^ self readObject: aDictionary 
]

{ #category : 'as yet unclassified' }
JSONSchemaObject >> read: string object: object [
	| reader neededKeys |
	reader := (NeoJSONReader on: string readStream).
	neededKeys := self neededKeys.
	reader parseMapKeysDo: [ :key | | schema value |
		schema :=	properties 
			at: key 
			ifAbsent: [
				self flag: #todo.
				"check for additionProperties"
				JSONInvalidPropertyError signal: 'no property ', key asString, ' defined']. 
		value := schema readUsing: reader.
		object 
			perform: key asSymbol asMutator 
			with: value.
		neededKeys remove: key ifAbsent: [] ].
	neededKeys ifNotEmpty: [ 
		JSONMissingRequiredProperty signal: 'missing properties ', ($, join: neededKeys) ].
	^ object
]

{ #category : 'as yet unclassified' }
JSONSchemaObject >> readKey: key reader: reader [
	properties ifNotNil: [  
		properties 
			at: key
			ifPresent: [ :propertySchema |
				"schema for property is existing using it to read the value"
				^ propertySchema readUsing: reader ] ].
		
	(additionalProperties isNil | (additionalProperties = true)) 
		ifTrue: [ 
			"if additionProperties is absent or true any additional property
			is allowed"
			^ reader parseValue ].
	
	(additionalProperties = false) 
		ifTrue: [
			"addtional properties are disallowed" 											
			JSONTypeError signal: 'additional properties are not allowed' ].
				
	"if additionalProperty is present and not a boolean it is a
	schema defining the type of the addtional properties"
	^ additionalProperties readUsing: reader
]

{ #category : 'accessing' }
JSONSchemaObject >> readObject: jsonObject [ 
	| object |
	object := self instanceClass new.
	self 
		readProperties: properties
		from: jsonObject
		writeTo: object.  
	additionalProperties ifTrue: [ 
		(jsonObject keys difference: properties keys) do: [ :each |
			object at: each put: (jsonObject at: each) ] ].
	^ object
]

{ #category : 'reading' }
JSONSchemaObject >> readString: aString [
	^ self readFrom: aString readStream
]

{ #category : 'private' }
JSONSchemaObject >> readUsing: reader [
	^ self 
		readUsing: reader
		object: self newInstance 
]

{ #category : 'private' }
JSONSchemaObject >> readUsing: reader object: object [
	| readKeys |
	readKeys := OrderedCollection new.
	reader parseMapKeysDo: [ :key | 
		object 
			jsonSchemaAt: key 
			put: (self readKey: key reader: reader).
		readKeys add: key ].
		
	self checkRequiredKeys: readKeys.
	^ object
]

{ #category : 'accessing' }
JSONSchemaObject >> required [
	^ required
]

{ #category : 'accessing' }
JSONSchemaObject >> required: aCollection [ 
	required := aCollection 
]

{ #category : 'accessing' }
JSONSchemaObject >> schemaProperties [
	^ super schemaProperties , {   
		#properties -> nil.
		#additionalProperties -> true.
		#required -> nil}
]

{ #category : 'validation' }
JSONSchemaObject >> validateType: aDictionary [
	aDictionary isDictionary ifFalse: [
		JSONTypeError signal: aDictionary printString, ' is not an object' ].
	required ifNotNil: [
		self required do: [ :requiredProperty |
			(aDictionary includesKey: requiredProperty) ifFalse: [
				JSONSchemaMissingRequiredProperty new
					property: requiredProperty;
					signal ] ] ].
	properties ifNotNil: [
		properties associationsDo: [ :property |
			aDictionary
				at: property key
				ifPresent: [ :elementValue | property value validate: elementValue ] ] ]
]

{ #category : 'writing' }
JSONSchemaObject >> write: anObject [
	^ String streamContents: [ :stream |
		self write: anObject on: (JSONSchemaWriter on: stream)  ]
]

{ #category : 'writing' }
JSONSchemaObject >> write: anObject on: writer [
	self checkRequiredKeys: anObject jsonSchemaKeys.
	writer writeMapStreamingDo: [ :streamWriter |
		properties keysAndValuesDo: [ :key :schema | 
			(anObject jsonSchemaKeys includes: key) ifTrue: [  
				streamWriter
					writeKey: key 
					value: (anObject jsonSchemaAt: key)
					as: schema ] ] ]
]
