as yet unclassified
readUsing: reader
	| object containedKeys |
	object := NeoJSONObject new.
	reader parseMapKeysDo: [ :key | | value |
		value := properties at: key.
		object 
			at: key 
			put: (value readUsing: reader) ].
	required ifNotNil: [ 
		containedKeys := object keys intersection: properties keys.
		(containedKeys = required) ifFalse: [ 
		 	JSONTypeErrror signal: 'object is missing required properties ', ($, join: (required difference: containedKeys)) ] ].
	^ object