as yet unclassified
readUsing: reader
	| object |
	object := self newInstance.
	
	reader parseMapKeysDo: [ :key | 
		object 
			at: key 
			put: (self readKey: key reader: reader) ].
		
	self checkRequiredKeys: object keys.
	^ object