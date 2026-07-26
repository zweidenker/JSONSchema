Class {
	#name : 'JSONSchemaConstraint',
	#superclass : 'Object',
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
