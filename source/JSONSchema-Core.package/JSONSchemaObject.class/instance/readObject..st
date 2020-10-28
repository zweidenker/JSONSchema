accessing
readObject: jsonObject 
	| object |
	object := self instanceClass new.
	self 
		readProperties: properties
		from: jsonObject
		writeTo: object.  
	additionalProperties ifTrue: [ 
		(jsonObject keys difference: properties keys) do: [ :each |
			object at: each put: (jsonObject at: each) ] ].
	^ object