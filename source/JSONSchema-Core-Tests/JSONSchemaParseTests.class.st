Class {
	#name : 'JSONSchemaParseTests',
	#superclass : 'TestCase',
	#category : 'JSONSchema-Core-Tests',
	#package : 'JSONSchema-Core-Tests'
}

{ #category : 'examples' }
JSONSchemaParseTests >> exampleData1 [
	^ '{
  "firstName": "John",
  "lastName": "Doe",
  "age": 21
}'
]

{ #category : 'examples' }
JSONSchemaParseTests >> exampleData2 [
	^ '{
  "latitude": 48.858093,
  "longitude": 2.294694
}
'
]

{ #category : 'examples' }
JSONSchemaParseTests >> exampleData3 [
	^ '{
  "fruits": [ "apple", "orange", "pear" ],
  "vegetables": [
    {
      "veggieName": "potato",
      "veggieLike": true
    },
    {
      "veggieName": "broccoli",
      "veggieLike": false
    }
  ]
}'
]

{ #category : 'examples' }
JSONSchemaParseTests >> exampleSchema1 [
	^ '{
  "$id": "https://example.com/person.schema.json",
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "Person",
  "type": "object",
  "properties": {
    "firstName": {
      "type": "string",
      "description": "The person''s first name."
    },
    "lastName": {
      "type": "string",
      "description": "The person''s last name."
    },
    "age": {
      "description": "Age in years which must be equal to or greater than zero.",
      "type": "integer",
      "minimum": 0
    }
  }
}'
]

{ #category : 'examples' }
JSONSchemaParseTests >> exampleSchema2 [
	^ '{
  "id": "https://example.com/geographical-location.schema.json",
  "$schema": "http://json-schema.org/draft-07/schema#",
  "title": "Longitude and Latitude Values",
  "description": "A geographical coordinate.",
  "required": [ "latitude", "longitude" ],
  "type": "object",
  "properties": {
    "latitude": {
      "type": "number",
      "minimum": -90,
      "maximum": 90
    },
    "longitude": {
      "type": "number",
      "minimum": -180,
      "maximum": 180
    }
  }
}'
]

{ #category : 'examples' }
JSONSchemaParseTests >> exampleSchema3 [
	^ '{
  "id": "https://example.com/arrays.schema.json",
  "$schema": "http://json-schema.org/draft-07/schema#",
  "description": "A representation of a person, company, organization, or place",
  "type": "object",
  "properties": {
    "fruits": {
      "type": "array",
      "items": {
        "type": "string"
      }
    },
    "vegetables": {
      "type": "array",
      "items": { "$ref": "#/definitions/veggie" }
    }
  },
  "definitions": {
    "veggie": {
      "type": "object",
      "required": [ "veggieName", "veggieLike" ],
      "properties": {
        "veggieName": {
          "type": "string",
          "description": "The name of the vegetable."
        },
        "veggieLike": {
          "type": "boolean",
          "description": "Do I like this vegetable?"
        }
      }
    }
  }
}'
]

{ #category : 'tests' }
JSONSchemaParseTests >> testParseExample1 [
	| schema |
	schema := JSONSchema fromString: self exampleSchema1.
	schema validate: (NeoJSONReader fromString: self exampleData1)
]

{ #category : 'tests' }
JSONSchemaParseTests >> testParseExample2 [
	| schema |
	schema := JSONSchema fromString: self exampleSchema2.
	schema validate: (NeoJSONReader fromString: self exampleData2)
]

{ #category : 'tests' }
JSONSchemaParseTests >> testParseExample3 [
	| schema |
	schema := JSONSchema fromString: self exampleSchema3.
	schema validate: (NeoJSONReader fromString: self exampleData3)
]
