meta-object-protocol
read: aCollection
	items isCollection 
		ifTrue: [ 
			items withIndexCollect: [ :item :idx |
				(items at: idx) read: item ] ]
		ifFalse: [ 
			aCollection collect: [ :item | 
				items read: item ] ]