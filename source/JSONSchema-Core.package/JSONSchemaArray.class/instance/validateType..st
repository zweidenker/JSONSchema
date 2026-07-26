validating
validateType: aCollection
	aCollection isArray ifFalse: [
		JSONTypeError signal: aCollection printString, ' is not an array' ].
	items isCollection
		ifTrue: [
			(aCollection size = items size) ifFalse: [
				JSONTypeError signal: aCollection asString, ' has different size than schema' ].
			aCollection withIndexDo: [:item :idx |
				(items at: idx) validateType: item ] ]
		ifFalse: [
			aCollection do: [ :each |
				items validateType: each ] ]