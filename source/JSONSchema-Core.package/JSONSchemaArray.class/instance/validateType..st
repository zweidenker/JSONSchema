validating
validateType: aCollection 
	items isCollection 
		ifTrue: [ 
			(aCollection size = items size) ifFalse: [ 
				JSONTypeError signal: aCollection asString, ' has different size than schema' ].
			aCollection withIndexDo: [:item :idx |
				(items at: idx) validateType: item ] ]
		ifFalse: [  
			aCollection do: [ :each | 
				items validateType: each ] ] 