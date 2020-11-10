private
readUsing: reader object: object
	| readKeys |
	readKeys := OrderedCollection new.
	reader parseMapKeysDo: [ :key | 
		object 
			jsonSchemaAt: key 
			put: (self readKey: key reader: reader).
		readKeys add: key ].
		
	self checkRequiredKeys: readKeys.
	^ object