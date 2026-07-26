Class {
	#name : 'JSONFormatURI',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'reading' }
JSONFormatURI class >> basicConvertString: aString [ 
	^ aString asZnUrl 
]

{ #category : 'as yet unclassified' }
JSONFormatURI class >> encodeJSON: aZnURL [
	^ aZnURL asString
	
]

{ #category : 'formatting' }
JSONFormatURI class >> formatName [ 
	^ #uri
]

{ #category : 'services' }
JSONFormatURI class >> validate: aUrl [
	(aUrl isKindOf: ZnUrl) ifFalse: [ 
		JSONTypeError
			signal: aUrl printString , ' is not a URL' ]
	
]

{ #category : 'writing' }
JSONFormatURI class >> write: aZnUrl [ 
	^ aZnUrl asString
]
