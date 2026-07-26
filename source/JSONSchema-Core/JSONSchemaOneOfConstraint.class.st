Class {
	#name : 'JSONSchemaOneOfConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'oneOf'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaOneOfConstraint >> oneOf [
	^ oneOf
]

{ #category : 'accessing' }
JSONSchemaOneOfConstraint >> oneOf: aCollection [
	oneOf := aCollection
]

{ #category : 'accessing' }
JSONSchemaOneOfConstraint >> definitionProperties [
	^ #( oneOf )
]

{ #category : 'validation' }
JSONSchemaOneOfConstraint >> validate [
	^ oneOf notNil
]

{ #category : 'validation' }
JSONSchemaOneOfConstraint >> validate: anObject [
	| visitor count |
	visitor := JSONSchemaReferenceResolveVisitor new.
	count := 0.
	oneOf do: [ :definition |
		[ (visitor visitSchemaSpec: definition) validate: anObject.
		  count := count + 1 ]
			on: JSONSchemaError do: [ :e | ] ].
	count = 1 ifFalse: [
		JSONConstraintError signal: anObject printString, ' matches ', count printString, ' of the oneOf schemas, expected exactly 1' ]
]

{ #category : 'validation' }
JSONSchemaOneOfConstraint >> validateType: anObject [
	^ true
]
