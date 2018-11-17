as yet unclassified
lookupReference: aJSONSchemaReference 
	(aJSONSchemaReference isLocalPath) ifTrue: [ 
		^ definitions at: ($/ split: aJSONSchemaReference path) third ].
	Error signal: 'only local references are supported'