Class {
	#name : 'JSONSchemaTypeUnionConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'typeArray'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'accessing' }
JSONSchemaTypeUnionConstraint >> definitionProperties [
	^ #( typeArray )
]

{ #category : 'accessing' }
JSONSchemaTypeUnionConstraint >> typeArray [
	^ typeArray
]

{ #category : 'accessing' }
JSONSchemaTypeUnionConstraint >> typeArray: aCollection [
	typeArray := aCollection
]

{ #category : 'validation' }
JSONSchemaTypeUnionConstraint >> validate [
	^ typeArray notNil
]

{ #category : 'validation' }
JSONSchemaTypeUnionConstraint >> validate: anObject [
	"The instance must match at least one of the listed JSON types."
	(typeArray anySatisfy: [ :typeName | self value: anObject matchesTypeNamed: typeName ])
		ifFalse: [
			JSONTypeError signal: anObject printString, ' is none of the allowed types: ', (',' join: typeArray) ]
]

{ #category : 'validation' }
JSONSchemaTypeUnionConstraint >> validateType: anObject [
	"a union type applies to a value of any type."
	^ true
]

{ #category : 'validation' }
JSONSchemaTypeUnionConstraint >> value: anObject matchesTypeNamed: aTypeName [
	"Top-level JSON type-category test - a union type only constrains the type tag,
	not any nested structure (unlike a single type:array/object schema)."
	aTypeName = 'null' ifTrue: [ ^ anObject isNil ].
	aTypeName = 'boolean' ifTrue: [ ^ anObject isKindOf: Boolean ].
	aTypeName = 'integer' ifTrue: [ ^ anObject isKindOf: Integer ].
	aTypeName = 'number' ifTrue: [ ^ anObject isKindOf: Number ].
	aTypeName = 'string' ifTrue: [ ^ anObject isString ].
	aTypeName = 'array' ifTrue: [ ^ anObject isArray ].
	aTypeName = 'object' ifTrue: [ ^ anObject isDictionary ].
	^ false
]
