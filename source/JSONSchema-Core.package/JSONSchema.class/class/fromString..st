instance creation
fromString: aString
	"convenience method to read a schema from a string. A string is always a 
	JSON schema document and we retrieved the schema from this document"
	^ (JSONSchemaDocument fromString: aString) asJSONSchema