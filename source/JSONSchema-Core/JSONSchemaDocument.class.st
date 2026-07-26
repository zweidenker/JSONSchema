Class {
	#name : 'JSONSchemaDocument',
	#superclass : 'JSONSchemaDefinition',
	#instVars : [
		'definitions',
		'schemasByPath'
	],
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'accessing' }
JSONSchemaDocument class >> neoJsonMapping: mapper [
	super neoJsonMapping: mapper.
	mapper for: self do: [ :mapping |
		(mapping mapInstVar: #definitions) valueSchema: #SchemaMap ].
		
	mapper for: #SchemaMap customDo: [ :mapping |
		mapping mapWithValueSchema: JSONSchemaDefinition ].


]

{ #category : 'accessing' }
JSONSchemaDocument >> asJSONSchema [ 
	^ self resolve asJSONSchema 
]

{ #category : 'initialization' }
JSONSchemaDocument >> initialize [
	super initialize.
	schemasByPath := Dictionary new
]

{ #category : 'as yet unclassified' }
JSONSchemaDocument >> lookupReference: aJSONSchemaReference [ 
	(aJSONSchemaReference isLocalPath) ifTrue: [ 
		^ definitions at: ($/ split: aJSONSchemaReference path) third ].
	Error signal: 'only local references are supported'
]

{ #category : 'decoration' }
JSONSchemaDocument >> resolve [
	^ JSONSchemaReferenceResolveVisitor new
		schemaRepository: self;
		read: (self as: JSONSchemaDefinition)
]

{ #category : 'initialization' }
JSONSchemaDocument >> resolveReference: aReference continueOn: aVisitor [
	| schema |
	schemasByPath 
		at: aReference path
		ifPresent: [ :value | ^ value ].

	schema := (self lookupReference: aReference) asJSONSchema.
	schemasByPath
		at: aReference path
		put: schema.
	aVisitor visit: schema.
	^ schema
]

{ #category : 'decoration' }
JSONSchemaDocument >> schema [	 
	^ self resolve
]
