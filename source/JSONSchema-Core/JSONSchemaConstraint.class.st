Class {
	#name : 'JSONSchemaConstraint',
	#superclass : 'Object',
	#instVars : [
		'schemaRepository'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'initialization' }
JSONSchemaConstraint >> initializeFromDefinition: aSchemaDefinition [
	self definitionProperties do: [ :each|
		(aSchemaDefinition perform: each asSymbol) ifNotNil: [ :value |
			self perform: each asSymbol asMutator with: value ] ]
]

{ #category : 'resolving' }
JSONSchemaConstraint >> resolveVisitor [
	"A reference-resolving visitor primed with the document repository (may be nil
	for schemas built outside a document, in which case $ref sub-schemas are not
	resolvable). The repository is stamped on by JSONSchemaReferenceResolveVisitor
	during document resolution."
	^ JSONSchemaReferenceResolveVisitor new
		schemaRepository: schemaRepository;
		yourself
]

{ #category : 'accessing' }
JSONSchemaConstraint >> schemaRepository: anObject [
	schemaRepository := anObject
]

{ #category : 'validation' }
JSONSchemaConstraint >> validate [
	self subclassResponsibility 
]

{ #category : 'validation' }
JSONSchemaConstraint >> validate: anObject [
	self subclassResponsibility 
]

{ #category : 'validation' }
JSONSchemaConstraint >> validateType: anObject [
	self subclassResponsibility 
]
