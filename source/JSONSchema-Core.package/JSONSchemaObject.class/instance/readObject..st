as yet unclassified
readObject: jsonObject 
	| object |
	object := NeoJSONObject new.
	self 
		readProperties: properties
		from: jsonObject
		writeTo: object.  
	additionalProperties ifTrue: [ 
		(jsonObject keys difference: properties keys) do: [ :each |
			object at: each put: (jsonObject at: each) ] ].
	^ object