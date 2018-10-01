visiting
visitSchemaDefinition: aSchemaDefinition
self halt.
	^ aSchemaDefinition
		"properties: (self visitAll: aSchema properties);"
		"items: (self visit: aSchema items);"
		basicType: (self visit: aSchemaDefinition type);
		yourself		