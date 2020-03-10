meta-object-protocol
read: aCollection
	^ aCollection collect: [ :item | 
		items read: item ]