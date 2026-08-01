Class {
	#name : 'JSONSchemaAnyObject',
	#superclass : 'JSONSchemaBasicObject',
	#instVars : [
		'mergedAllOfObject'
	],
	#category : 'JSONSchema-Core-Model',
	#package : 'JSONSchema-Core',
	#tag : 'Model'
}

{ #category : 'instance creation' }
JSONSchemaAnyObject class >> typeName [
	^ #any
]

{ #category : 'visiting' }
JSONSchemaAnyObject >> acceptJSONSchema: aVisitor [
	^ aVisitor visitAnyObject: self
]

{ #category : 'allOf reading' }
JSONSchemaAnyObject >> allOfConstraint [
	^ self constraints detect: [ :c | c isKindOf: JSONSchemaAllOfConstraint ] ifNone: [ nil ]
]

{ #category : 'allOf reading' }
JSONSchemaAnyObject >> mergeObjectSchemas: schemas [
	"Merges properties (union - later branches win on key conflicts), required (union),
	additionalProperties (false wins if any branch forbids extras, default true otherwise),
	and instanceClass (first non-default one found) across several object schemas into one
	real JSONSchemaObject, so reading gets real per-property type coercion."
	| merged mergedProperties mergedRequired |
	merged := JSONSchemaObject new.
	mergedProperties := Dictionary new.
	mergedRequired := OrderedCollection new.
	schemas do: [ :schema |
		schema properties ifNotNil: [ mergedProperties addAll: schema properties ].
		schema required ifNotNil: [ mergedRequired addAll: schema required ].
		(schema additionalProperties isKindOf: JSONSchemaBooleanFalse) ifTrue: [
			merged additionalProperties: schema additionalProperties ].
		(schema instanceClass ~~ schema defaultInstanceClass) ifTrue: [
			merged instanceClass: schema instanceClass ] ].
	merged properties: mergedProperties.
	merged required: mergedRequired asArray.
	^ merged
]

{ #category : 'allOf reading' }
JSONSchemaAnyObject >> mergedAllOfObjectSchema [
	"If this schema resolves from a bare allOf composition of only object-shaped branches
	(the common 'extends' pattern, e.g. Pet = allOf[NewPet, {id}] - #asJSONSchema never
	sets schemaClass for a bare allOf, so it degrades to JSONSchemaAnyObject), build and
	cache a real JSONSchemaObject merging all branches so reading gets real per-property
	type coercion instead of a raw passthrough. Answers nil when allOf is absent or any
	branch is not object-shaped (a mixed/primitive allOf has no sensible single merged
	reading target, and is left as the existing raw passthrough)."
	| constraint resolvedBranches |
	mergedAllOfObject ifNotNil: [ ^ mergedAllOfObject ].
	constraint := self allOfConstraint.
	constraint ifNil: [ ^ nil ].
	resolvedBranches := constraint allOf collect: [ :definition | constraint resolveVisitor visitSchemaSpec: definition ].
	(resolvedBranches allSatisfy: [ :schema | schema isKindOf: JSONSchemaObject ]) ifFalse: [ ^ nil ].
	^ mergedAllOfObject := self mergeObjectSchemas: resolvedBranches
]

{ #category : 'reading-primitive data' }
JSONSchemaAnyObject >> read: anObject [
	"Delegate to a merged object schema for a bare allOf-of-objects composition (see
	#mergedAllOfObjectSchema); otherwise unchanged - a genuine any/no-type schema."
	| merged |
	merged := self mergedAllOfObjectSchema.
	^ merged ifNotNil: [ merged read: anObject ] ifNil: [ anObject ]
]

{ #category : 'reading' }
JSONSchemaAnyObject >> read: string object: object [
	| json |
	json := (NeoJSONReader on: string readStream) next .
	json isDictionary ifFalse: [
		JSONTypeError signal: 'json type is not object' ].
	json keysAndValuesDo: [ :key :value |
		object
			jsonSchemaAt: key asSymbol
			put: value ].
	^ object
]

{ #category : 'reading' }
JSONSchemaAnyObject >> readUsing: aReader [
	"Delegate to a merged object schema for a bare allOf-of-objects composition (see
	#mergedAllOfObjectSchema) so reading gets real per-property type coercion instead of
	a raw passthrough; otherwise unchanged - a genuine any/no-type schema."
	| merged |
	merged := self mergedAllOfObjectSchema.
	^ merged ifNotNil: [ merged readUsing: aReader ] ifNil: [ aReader next ]
]

{ #category : 'writing' }
JSONSchemaAnyObject >> write: anObject [
	^ String streamContents: [ :stream |
		self write: anObject on: (JSONSchemaWriter on: stream)  ]
]

{ #category : 'writing' }
JSONSchemaAnyObject >> write: anObject on: aWriter [
	aWriter nextPut: anObject
]
