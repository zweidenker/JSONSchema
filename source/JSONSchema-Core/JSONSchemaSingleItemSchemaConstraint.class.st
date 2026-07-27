Class {
	#name : 'JSONSchemaSingleItemSchemaConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'items'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaSingleItemSchemaConstraint >> items [
	^ items
]

{ #category : 'accessing' }
JSONSchemaSingleItemSchemaConstraint >> items: aDefinition [
	items := aDefinition
]

{ #category : 'accessing' }
JSONSchemaSingleItemSchemaConstraint >> definitionProperties [
	^ #( items )
]

{ #category : 'validation' }
JSONSchemaSingleItemSchemaConstraint >> validate [
	^ items notNil
]

{ #category : 'validation' }
JSONSchemaSingleItemSchemaConstraint >> validate: anArray [
	| resolved |
	resolved := self resolveVisitor visitSchemaSpec: items.
	anArray do: [ :each | resolved validate: each ]
]

{ #category : 'validation' }
JSONSchemaSingleItemSchemaConstraint >> validateType: anObject [
	"items only applies to array-shaped instances - a schema like {""items"":false}
	with no explicit type:array must silently accept non-array values, per spec.
	Named distinctly from JSONSchemaItemsConstraint (which is the pre-existing
	minItems/maxItems size constraint - do not confuse the two, a same-name
	classInstaller redefinition once silently clobbered that class)."
	^ anObject isArray
]
