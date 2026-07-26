Class {
	#name : 'JSONConstraintTests',
	#superclass : 'TestCase',
	#category : 'JSONSchema-Core-Tests',
	#package : 'JSONSchema-Core-Tests'
}

{ #category : 'tests' }
JSONConstraintTests >> testEnumIncluded [
	| constraint |
	constraint := JSONSchemaEnumConstraint new
		options: #( one two three ).
	self 
		shouldnt: [ constraint validate: 'two' ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testEnumNotIncluded [
	| constraint |
	constraint := JSONSchemaEnumConstraint new
		options: #( one two three ).
	self 
		should: [ constraint validate: 'four' ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testIntervalExclusiveAtEnd [
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		minimum: 0;
		exclusiveMaximum: 10.
	self 
		should: [ constraint validate: 10 ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testIntervalExclusiveAtStart [
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		exclusiveMinimum: 0;
		exclusiveMaximum: 10.
	self 
		should: [ constraint validate: 0 ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testIntervalInRange [
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		minimum: 0;
		maximum: 10.
	self 
		shouldnt: [ constraint validate: 5 ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testIntervalInRangeAtEnd [
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		minimum: 0;
		maximum: 10.
	self 
		shouldnt: [ constraint validate: 10 ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testIntervalInRangeAtStart [
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		minimum: 0;
		maximum: 10.
	self 
		shouldnt: [ constraint validate: 0 ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testIntervalOpenEndInRange [
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		minimum: 0.
	self 
		shouldnt: [ constraint validate: 5 ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testIntervalOpenStartInRange [
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		maximum: 10.
	self 
		shouldnt: [ constraint validate: -5 ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testIntervalTooLargeForRange [
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		minimum: 0;
		maximum: 10.
	self 
		should: [ constraint validate: 100 ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testIntervalTooSmallForRange [
	| constraint |
	constraint := JSONSchemaIntervalConstraint new
		minimum: 0;
		maximum: 10.
	self 
		should: [ constraint validate: -1 ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testItemsInRange [
	| constraint |
	constraint := JSONSchemaItemsConstraint new
		minItems: 1;
		maxItems: 10.
	self
		shouldnt: [ constraint validate: #(1 2 3 4 5) ]
		raise: JSONConstraintError
]

{ #category : 'tests' }
JSONConstraintTests >> testItemsOpenMaximum [
	| constraint |
	constraint := JSONSchemaItemsConstraint new
		minItems: 5.
	self 
		shouldnt: [ constraint validate: #(1 2 3 4 5 6) ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testItemsOpenMinimum [
	| constraint |
	constraint := JSONSchemaItemsConstraint new
		maxItems: 10.
	self 
		shouldnt: [ constraint validate: #(1 2 3) ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testItemsTooLargeForRange [
	| constraint |
	constraint := JSONSchemaItemsConstraint new
		minItems: 1;
		maxItems: 10.
	self 
		should: [ constraint validate: #(1 2 3 4 5 6 7 8 9 10 11) ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testItemsTooSmallForRange [
	| constraint |
	constraint := JSONSchemaItemsConstraint new
		minItems: 1;
		maxItems: 10.
	self 
		should: [ constraint validate: #() ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testLengthInRange [
	| constraint |
	constraint := JSONSchemaLengthConstraint new
		minLength: 1;
		maxLength: 10.
	self 
		shouldnt: [ constraint validate: 'hello' ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testLengthOpenMaximum [
	| constraint |
	constraint := JSONSchemaLengthConstraint new
		minLength: 5.
	self 
		shouldnt: [ constraint validate: 'hello world' ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testLengthOpenMinimum [
	| constraint |
	constraint := JSONSchemaLengthConstraint new
		maxLength: 10.
	self 
		shouldnt: [ constraint validate: '' ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testLengthTooLargeForRange [
	| constraint |
	constraint := JSONSchemaLengthConstraint new
		minLength: 1;
		maxLength: 10.
	self 
		should: [ constraint validate: 'hello world' ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testLengthTooSmallForRange [
	| constraint |
	constraint := JSONSchemaLengthConstraint new
		minLength: 1;
		maxLength: 10.
	self 
		should: [ constraint validate: '' ]
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testMulitpleOfIncluded [
	self 
		shouldnt: [ (JSONSchema number multipleOf: 2) validate: 16 ] 
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testMulitpleOfNotIncluded [
	self 
		should: [ (JSONSchema number multipleOf: 2) validate: 15 ] 
		raise: JSONConstraintError 
]

{ #category : 'tests' }
JSONConstraintTests >> testSizeInRange [
	| constraint |
	constraint := JSONSchemaSizeConstraint new
		minProperties: 1;
		maxProperties: 10.
	self
		shouldnt: [ constraint
				validate:
					{('a' -> 1).
					('b' -> 2).
					('c' -> 3)} asDictionary ]
		raise: JSONConstraintError
]

{ #category : 'tests' }
JSONConstraintTests >> testSizeOpenMaximum [
	| constraint |
	constraint := JSONSchemaSizeConstraint new
		minProperties: 2.
	self
		shouldnt: [ constraint
				validate:
					{('a' -> 1).
					('b' -> 2).
					('c' -> 3)} asDictionary ]
		raise: JSONConstraintError
]

{ #category : 'tests' }
JSONConstraintTests >> testSizeOpenMinimum [
	| constraint |
	constraint := JSONSchemaSizeConstraint new
		maxProperties: 10.
	self
		shouldnt: [ constraint
				validate:
					{('a' -> 1).
					('b' -> 2).
					('c' -> 3)} asDictionary ]
		raise: JSONConstraintError
]

{ #category : 'tests' }
JSONConstraintTests >> testSizeTooLargeForRange [
	| constraint |
	constraint := JSONSchemaSizeConstraint new
		minProperties: 1;
		maxProperties: 2.
	self
		should: [ constraint
				validate:
					{('a' -> 1).
					('b' -> 2).
					('c' -> 3)} asDictionary ]
		raise: JSONConstraintError
]

{ #category : 'tests' }
JSONConstraintTests >> testSizeTooSmallForRange [
	| constraint |
	constraint := JSONSchemaSizeConstraint new
		minProperties: 4;
		maxProperties: 10.
	self
		should: [ constraint
				validate:
					{('a' -> 1).
					('b' -> 2).
					('c' -> 3)} asDictionary ]
		raise: JSONConstraintError
]

{ #category : 'tests' }
JSONConstraintTests >> testUniqueness [
	| constraint |
	constraint := JSONSchemaUniquenessConstraint new
		uniqueItems: true.
	self
		shouldnt: [ constraint validate: #(1 2 3 4 5) ]
		raise: JSONConstraintError
]

{ #category : 'tests' }
JSONConstraintTests >> testUniquenessDoublet [
	| constraint |
	constraint := JSONSchemaUniquenessConstraint new
		uniqueItems: true.
	self
		should: [ constraint validate: #(1 1 2 3 4 5) ]
		raise: JSONConstraintError
]

{ #category : 'tests' }
JSONConstraintTests >> testUniquenessDoubletAllowed [
	| constraint |
	constraint := JSONSchemaUniquenessConstraint new
		uniqueItems: false.
	self
		shouldnt: [ constraint validate: #(1 1 2 3 4 5) ]
		raise: JSONConstraintError
]

{ #category : 'tests' }
JSONConstraintTests >> testUniquenessEmpty [
	| constraint |
	constraint := JSONSchemaUniquenessConstraint new
		uniqueItems: true.
	self
		shouldnt: [ constraint validate: #() ]
		raise: JSONConstraintError
]
