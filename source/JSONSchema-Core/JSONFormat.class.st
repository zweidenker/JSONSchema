Class {
	#name : 'JSONFormat',
	#superclass : 'Object',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'services' }
JSONFormat class >> basicConvertString: aString [
	self subclassResponsibility 
]

{ #category : 'services' }
JSONFormat class >> convertString: aString [
	^ [ self basicConvertString: aString ]
		on: Error 
		do: [ :error | JSONTypeError signal: error description ]
]

{ #category : 'formatting' }
JSONFormat class >> formatName [
	self subclassResponsibility
]

{ #category : 'instance creation' }
JSONFormat class >> formatNamed: aString [ 
	^ (self allSubclasses reject: #isAbstract)
		detect: [ :each | each formatName = aString ]
		ifNone: [ JSONInvalidFormatName signal: 'cannot find format with name ', aString asString ]
]

{ #category : 'testing' }
JSONFormat class >> isAbstract [
	^ self = JSONFormat
]

{ #category : 'reading' }
JSONFormat class >> read: anObject [ 
	self validate: anObject.
	^ anObject
]

{ #category : 'reading' }
JSONFormat class >> readString: aString [ 
	self validateString: aString.
	^ self read: (self convertString: aString)
]

{ #category : 'services' }
JSONFormat class >> validate: anObject [
	"subclasses may override if needed.
	will raise a JSONTypeErrror if an object does not respect the said format"
]

{ #category : 'services' }
JSONFormat class >> validateString: aString [
	"subclasses may override if needed.
	will raise a JSONTypeErrror if an object does not respect the said format"
]
