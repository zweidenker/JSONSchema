accessing
schemaString
	^ '{"dependencies":{"foo''bar":{"required":["foo\"bar"]},"foo\"bar":["foo''bar"],"foo\nbar":["foo\rbar"],"foo\tbar":{"minProperties":4}}}'