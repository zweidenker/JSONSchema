Class {
	#name : 'JSONSchemaContainsConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'contains'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaContainsConstraint >> contains [
	^ contains
]

{ #category : 'accessing' }
JSONSchemaContainsConstraint >> contains: aDefinition [
	contains := aDefinition
]

{ #category : 'accessing' }
JSONSchemaContainsConstraint >> definitionProperties [
	^ #( contains )
]

{ #category : 'validation' }
JSONSchemaContainsConstraint >> validate [
	^ contains notNil
]

{ #category : 'validation' }
JSONSchemaContainsConstraint >> validate: anArray [
	"At least one array element must validate against the contains sub-schema.
	An empty array therefore always fails."
	| resolved |
	resolved := self resolveVisitor visitSchemaSpec: contains.
	(anArray anySatisfy: [ :each |
		[ resolved validate: each. true ] on: JSONSchemaError do: [ :e | false ] ])
			ifFalse: [
				JSONConstraintError signal: anArray printString, ' contains no element matching the contains schema' ]
]

{ #category : 'validation' }
JSONSchemaContainsConstraint >> validateType: anObject [
	"contains only constrains arrays; anything else passes silently."
	^ anObject isArray
]
