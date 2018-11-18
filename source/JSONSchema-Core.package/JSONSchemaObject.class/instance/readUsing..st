as yet unclassified
readUsing: reader
	| object |
	object := self newInstance.
	
	reader parseMapKeysDo: [ :key | 
		object 
			jsonSchemaAt: key 
			put: (self readKey: key reader: reader) ].
		
	self checkRequiredKeys: object jsonSchemaKeys.
	^ object