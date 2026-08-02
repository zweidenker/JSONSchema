Class {
	#name : 'JSONSchemaSingleItemSchemaConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'items',
		'additionalItems'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaSingleItemSchemaConstraint >> definitionProperties [
	^ #( items additionalItems )
]

{ #category : 'initialization' }
JSONSchemaSingleItemSchemaConstraint >> initializeFromDefinition: aDefinition [
	"items may be a single schema or an array of schemas (tuple); additionalItems
	governs positions beyond a tuple."
	items := aDefinition items.
	additionalItems := aDefinition additionalItems
]

{ #category : 'accessing' }
JSONSchemaSingleItemSchemaConstraint >> items [
	^ items
]

{ #category : 'accessing' }
JSONSchemaSingleItemSchemaConstraint >> items: aDefinition [
	items := aDefinition
]

{ #category : 'validation' }
JSONSchemaSingleItemSchemaConstraint >> validate [
	^ items notNil
]

{ #category : 'validation' }
JSONSchemaSingleItemSchemaConstraint >> validate: anArray [
	items isCollection
		ifTrue: [ self validateTuple: anArray ]
		ifFalse: [ | resolved |
			resolved := self resolveVisitor visitSchemaSpec: items.
			anArray do: [ :each | resolved validate: each ] ]
]

{ #category : 'validation' }
JSONSchemaSingleItemSchemaConstraint >> validateTuple: anArray [
	"Positional validation: element i against items[i]. Elements beyond the tuple are
	validated against additionalItems when it is an actual schema (nil/absent = allowed;
	additionalItems:false resolves to JSONSchemaBooleanFalse = no extra items)."
	| resolvedTuple |
	resolvedTuple := items collect: [ :def | self resolveVisitor visitSchemaSpec: def ].
	anArray withIndexDo: [ :each :i |
		i <= resolvedTuple size
			ifTrue: [ (resolvedTuple at: i) validate: each ]
			ifFalse: [ (additionalItems isKindOf: JSONSchema) ifTrue: [ additionalItems validate: each ] ] ]
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
