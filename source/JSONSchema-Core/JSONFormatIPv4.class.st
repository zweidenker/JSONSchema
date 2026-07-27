Class {
	#name : 'JSONFormatIPv4',
	#superclass : 'JSONBasicStringFormat',
	#category : 'JSONSchema-Core-Formats',
	#package : 'JSONSchema-Core',
	#tag : 'Formats'
}

{ #category : 'reading' }
JSONFormatIPv4 class >> basicConvertString: aString [
	^ aString
]

{ #category : 'reading' }
JSONFormatIPv4 class >> encodeJSON: aString [
	^ aString
]

{ #category : 'accessing' }
JSONFormatIPv4 class >> formatName [
	^ 'ipv4'
]

{ #category : 'validation' }
JSONFormatIPv4 class >> validateString: aString [
	"Dotted-decimal IPv4: four octets 0..255. Reuses the IPv4 tail check from the
	ipv6 validator."
	(JSONFormatIPv6 isIPv4Part: aString) ifFalse: [
		JSONConstraintError signal: aString printString, ' is not a valid ipv4 address' ]
]
