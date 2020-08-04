accessing
items: aSchema 
	items := aSchema notNil
	ifTrue: [ aSchema ]
	ifFalse: [ JSONSchemaAnyObject new ]
	