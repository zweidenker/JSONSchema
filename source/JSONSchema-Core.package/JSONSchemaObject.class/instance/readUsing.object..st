private
readUsing: reader object: object
	
	reader parseMapKeysDo: [ :key | 
		object 
			jsonSchemaAt: key 
			put: (self readKey: key reader: reader) ].
		
	self checkRequiredKeys: object jsonSchemaKeys.
	^ object