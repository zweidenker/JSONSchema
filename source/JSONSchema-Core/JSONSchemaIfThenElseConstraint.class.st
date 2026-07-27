Class {
	#name : 'JSONSchemaIfThenElseConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'ifSchema',
		'thenSchema',
		'elseSchema'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'initialization' }
JSONSchemaIfThenElseConstraint >> initializeFromDefinition: aDefinition [
	"if/then/else are only active together with if; then/else without if are ignored."
	ifSchema := aDefinition ifSchema.
	thenSchema := aDefinition thenSchema.
	elseSchema := aDefinition elseSchema
]

{ #category : 'validation' }
JSONSchemaIfThenElseConstraint >> validate [
	^ ifSchema notNil
]

{ #category : 'validation' }
JSONSchemaIfThenElseConstraint >> validate: anObject [
	"If the instance validates against the if-schema, it must validate against then
	(when present); otherwise it must validate against else (when present)."
	| ifPassed |
	ifPassed := [ (self resolveVisitor visitSchemaSpec: ifSchema) validate: anObject. true ]
		on: JSONSchemaError do: [ :e | false ].
	ifPassed
		ifTrue: [ thenSchema ifNotNil: [ (self resolveVisitor visitSchemaSpec: thenSchema) validate: anObject ] ]
		ifFalse: [ elseSchema ifNotNil: [ (self resolveVisitor visitSchemaSpec: elseSchema) validate: anObject ] ]
]

{ #category : 'validation' }
JSONSchemaIfThenElseConstraint >> validateType: anObject [
	"conditional composition applies to a value of any type."
	^ true
]
