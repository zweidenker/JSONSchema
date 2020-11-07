as yet unclassified
write: aCollection on: writer
	| index |
	index := 0.
	^ writer
		writeList: aCollection with: [ :eachObject | 
			items isCollection 
				ifTrue: [ 
					index := index + 1.
					(items at: index) write: eachObject on: writer ]
				ifFalse: [ items write: eachObject on: writer ] ] 