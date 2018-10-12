as yet unclassified
readUsing: reader
	| object containedKeys |
	object := NeoJSONObject new.
	
	reader parseMapKeysDo: [ :key | 
		object 
			at: key 
			put: (self readKey: key reader: reader) ].
		
	required ifNotNil: [ 
		containedKeys := object keys intersection: properties keys.
		(containedKeys = required) ifFalse: [ 
		 	JSONTypeErrror signal: 'object is missing required properties ', ($, join: (required difference: containedKeys)) ] ].
	^ object