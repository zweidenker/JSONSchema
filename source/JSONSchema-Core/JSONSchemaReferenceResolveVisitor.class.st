Class {
	#name : 'JSONSchemaReferenceResolveVisitor',
	#superclass : 'JSONSchemaVisitor',
	#instVars : [
		'schemaRepository',
		'schemasByPath',
		'seen'
	],
	#category : 'JSONSchema-Core',
	#package : 'JSONSchema-Core'
}

{ #category : 'initialization' }
JSONSchemaReferenceResolveVisitor >> initialize [
	super initialize.
	schemasByPath := Dictionary new.
	seen := Set new
]

{ #category : 'accessing' }
JSONSchemaReferenceResolveVisitor >> resolver: anObject [
	resolver := anObject
]

{ #category : 'accessing' }
JSONSchemaReferenceResolveVisitor >> schemaRepository: anObject [ 
	schemaRepository := anObject
]

{ #category : 'visiting' }
JSONSchemaReferenceResolveVisitor >> visit: anObject [
	(seen includes: anObject) ifTrue: [ 
		^ anObject ].
	seen add: anObject.
	^ super visit: anObject
]

{ #category : 'visiting' }
JSONSchemaReferenceResolveVisitor >> visitReference: aReference [ 
	^ schemaRepository resolveReference: aReference continueOn: self
]

{ #category : 'as yet unclassified' }
JSONSchemaReferenceResolveVisitor >> visitSchemaSpec: aSchemaSpec [
	^ aSchemaSpec isReference 
		ifTrue: [ self visit: aSchemaSpec reference ]
		ifFalse: [ self visit: aSchemaSpec asJSONSchema ]
]
