Class {
	#name : 'JSONSchemaFormatConstraint',
	#superclass : 'JSONSchemaConstraint',
	#instVars : [
		'format'
	],
	#category : 'JSONSchema-Core-Constraints',
	#package : 'JSONSchema-Core',
	#tag : 'Constraints'
}

{ #category : 'validation' }
JSONSchemaFormatConstraint >> definitionProperties [
	"Empty: format is not round-tripped through the generic serialise path (the value
	is a JSONFormat class, and typed schemas already write format via JSONPrimitiveSchema)."
	^ #()
]

{ #category : 'validation' }
JSONSchemaFormatConstraint >> format [
	^ format
]

{ #category : 'validation' }
JSONSchemaFormatConstraint >> format: aFormat [
	format := aFormat
]

{ #category : 'validation' }
JSONSchemaFormatConstraint >> initializeFromDefinition: aDefinition [
	"Read the resolved JSONFormat class (or nil) from the definition. Overrides the
	generic property-copy since format is stored as a class, not a plain value, and
	must not be re-serialised through definitionProperties."
	format := aDefinition format
]

{ #category : 'validation' }
JSONSchemaFormatConstraint >> validate [
	^ format notNil
]

{ #category : 'validation' }
JSONSchemaFormatConstraint >> validate: aString [
	"Delegate to the format class. Unimplemented formats keep the no-op default
	(tolerant); implemented ones signal a JSONSchemaError on a malformed string."
	format validateString: aString
]

{ #category : 'validation' }
JSONSchemaFormatConstraint >> validateType: anObject [
	"format applies to strings only; non-strings pass through per JSON-Schema spec."
	^ anObject isString
]
