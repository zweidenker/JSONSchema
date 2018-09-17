as yet unclassified
read: aCollection
	^ aCollection collect: [ :item | 
		items read: item ]