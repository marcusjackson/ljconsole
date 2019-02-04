DROP TABLE IF EXISTS m_block;
CREATE TABLE m_block (
	id 				integer PRIMARY KEY,
	name 			varchar,
	created_at 		timestamp DEFAULT CURRENT_TIMESTAMP,
	modified_at 	timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER [TR_m_block_AfterUpdate_ModifiedAt]
AFTER UPDATE
ON m_block
FOR EACH ROW
BEGIN
UPDATE m_block SET modified_at = CURRENT_TIMESTAMP WHERE id = old.id;
END;

DROP TABLE IF EXISTS entry;
CREATE TABLE entry (
	id 				integer PRIMARY KEY,
	name 			varchar,
	created_at 		timestamp DEFAULT CURRENT_TIMESTAMP,
	modified_at 	timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER [TR_entry_AfterUpdate_ModifiedAt]
AFTER UPDATE
ON entry
FOR EACH ROW
BEGIN
UPDATE entry SET modified_at = CURRENT_TIMESTAMP WHERE id = old.id;
END;

DROP TABLE IF EXISTS block;
CREATE TABLE block (
	id 				integer PRIMARY KEY,
	entry_id 		integer NOT NULL REFERENCES entry(id),
	m_block_id 		integer NOT NULL REFERENCES m_block(id),
	payload 		text,
	media 			varchar,
	created_at 		timestamp DEFAULT CURRENT_TIMESTAMP,
	modified_at 	timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER [TR_block_AfterUpdate_ModifiedAt]
AFTER UPDATE
ON block
FOR EACH ROW
BEGIN
UPDATE block SET modified_at = CURRENT_TIMESTAMP WHERE id = old.id;
END;

DROP TABLE IF EXISTS grouping;
CREATE TABLE grouping (
	id 				integer PRIMARY KEY,
	name 			varchar,
	created_at 		timestamp DEFAULT CURRENT_TIMESTAMP,
	modified_at 	timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER [TR_grouping_AfterUpdate_ModifiedAt]
AFTER UPDATE
ON grouping
FOR EACH ROW
BEGIN
UPDATE grouping SET modified_at = CURRENT_TIMESTAMP WHERE id = old.id;
END;

DROP TABLE IF EXISTS entry_grouping;
CREATE TABLE entry_grouping (
	id 				integer PRIMARY KEY,
	entry_id 		integer NOT NULL REFERENCES entry(id),
	grouping_id 	integer NOT NULL REFERENCES grouping(id),
	created_at 		timestamp DEFAULT CURRENT_TIMESTAMP,
	modified_at 	timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER [TR_entry_grouping_AfterUpdate_ModifiedAt]
AFTER UPDATE
ON entry_grouping
FOR EACH ROW
BEGIN
UPDATE entry_grouping SET modified_at = CURRENT_TIMESTAMP WHERE id = old.id;
END;

DROP TABLE IF EXISTS grouping_keyword;
CREATE TABLE grouping_keyword (
	id 				integer PRIMARY KEY,
	grouping_id 	integer NOT NULL REFERENCES grouping(id),
	keyword 		text,
	created_at 		timestamp DEFAULT CURRENT_TIMESTAMP,
	modified_at 	timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER [TR_grouping_keyword_AfterUpdate_ModifiedAt]
AFTER UPDATE
ON grouping_keyword
FOR EACH ROW
BEGIN
UPDATE grouping_keyword SET modified_at = CURRENT_TIMESTAMP WHERE id = old.id;
END;

DROP TABLE IF EXISTS tag;
CREATE TABLE tag (
	id 				integer PRIMARY KEY,
	name 			varchar,
	created_at 		timestamp DEFAULT CURRENT_TIMESTAMP,
	modified_at 	timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER [TR_tag_AfterUpdate_ModifiedAt]
AFTER UPDATE
ON tag
FOR EACH ROW
BEGIN
UPDATE tag SET modified_at = CURRENT_TIMESTAMP WHERE id = old.id;
END;

DROP TABLE IF EXISTS grouping_tag;
CREATE TABLE grouping_tag (
	id 				integer PRIMARY KEY,
	grouping_id 	integer NOT NULL REFERENCES grouping(id),
	tag_id 			integer NOT NULL REFERENCES tag(id),
	created_at 		timestamp DEFAULT CURRENT_TIMESTAMP,
	modified_at 	timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER [TR_grouping_tag_AfterUpdate_ModifiedAt]
AFTER UPDATE
ON grouping_tag
FOR EACH ROW
BEGIN
UPDATE grouping_tag SET modified_at = CURRENT_TIMESTAMP WHERE id = old.id;
END;

DROP TABLE IF EXISTS tag_keyword;
CREATE TABLE tag_keyword (
	id 				integer PRIMARY KEY,
	tag_id 			integer NOT NULL REFERENCES tag(id),
	keyword 		text,
	created_at 		timestamp DEFAULT CURRENT_TIMESTAMP,
	modified_at 	timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER [TR_tag_keyword_AfterUpdate_ModifiedAt]
AFTER UPDATE
ON tag_keyword
FOR EACH ROW
BEGIN
UPDATE tag_keyword SET modified_at = CURRENT_TIMESTAMP WHERE id = old.id;
END;

DROP TABLE IF EXISTS nested_tag;
CREATE TABLE nested_tag (
	id 				integer PRIMARY KEY,
	tag_id 			integer NOT NULL REFERENCES tag(id),
	lft 			integer,
	rgt 			integer,
	created_at 		timestamp DEFAULT CURRENT_TIMESTAMP,
	modified_at 	timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER [TR_nested_tag_AfterUpdate_ModifiedAt]
AFTER UPDATE
ON nested_tag
FOR EACH ROW
BEGIN
UPDATE nested_tag SET modified_at = CURRENT_TIMESTAMP WHERE id = old.id;
END;

DROP TABLE IF EXISTS entity;
CREATE TABLE entity (
	id 				integer PRIMARY KEY,
	tag_id 			integer NOT NULL REFERENCES tag(id),
	category 		integer,
	created_at 		timestamp DEFAULT CURRENT_TIMESTAMP,
	modified_at 	timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER [TR_entity_AfterUpdate_ModifiedAt]
AFTER UPDATE
ON entity
FOR EACH ROW
BEGIN
UPDATE entity SET modified_at = CURRENT_TIMESTAMP WHERE id = old.id;
END;

DROP TABLE IF EXISTS location;
CREATE TABLE location (
	id 				integer PRIMARY KEY,
	tag_id 			integer NOT NULL REFERENCES tag(id),
	category 		integer,
	created_at 		timestamp DEFAULT CURRENT_TIMESTAMP,
	modified_at 	timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER [TR_location_AfterUpdate_ModifiedAt]
AFTER UPDATE
ON location
FOR EACH ROW
BEGIN
UPDATE location SET modified_at = CURRENT_TIMESTAMP WHERE id = old.id;
END;

DROP TABLE IF EXISTS entity_location;
CREATE TABLE entity_location (
	id 				integer PRIMARY KEY,
	entity_id 		integer NOT NULL REFERENCES entity(id),
	location_id 	integer NOT NULL REFERENCES location(id),
	start 			datetime,
	end 			datetime,
	created_at 		timestamp DEFAULT CURRENT_TIMESTAMP,
	modified_at 	timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER [TR_entity_location_AfterUpdate_ModifiedAt]
AFTER UPDATE
ON entity_location
FOR EACH ROW
BEGIN
UPDATE entity_location SET modified_at = CURRENT_TIMESTAMP WHERE id = old.id;
END;

DROP TABLE IF EXISTS purpose;
CREATE TABLE purpose (
	id 				integer PRIMARY KEY,
	tag_id 			integer NOT NULL REFERENCES tag(id),
	category 		integer,
	created_at 		timestamp DEFAULT CURRENT_TIMESTAMP,
	modified_at 	timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER [TR_purpose_AfterUpdate_ModifiedAt]
AFTER UPDATE
ON purpose
FOR EACH ROW
BEGIN
UPDATE purpose SET modified_at = CURRENT_TIMESTAMP WHERE id = old.id;
END;

DROP TABLE IF EXISTS subject;
CREATE TABLE subject (
	id 				integer PRIMARY KEY,
	tag_id 			integer NOT NULL REFERENCES tag(id),
	category 		integer,
	created_at 		timestamp DEFAULT CURRENT_TIMESTAMP,
	modified_at 	timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER [TR_subject_AfterUpdate_ModifiedAt]
AFTER UPDATE
ON subject
FOR EACH ROW
BEGIN
UPDATE subject SET modified_at = CURRENT_TIMESTAMP WHERE id = old.id;
END;

DROP TABLE IF EXISTS time;
CREATE TABLE time (
	id 				integer PRIMARY KEY,
	tag_id 			integer NOT NULL REFERENCES tag(id),
	category 		integer,
	start 			datetime,
	end 			datetime ,
	created_at 		timestamp DEFAULT CURRENT_TIMESTAMP,
	modified_at 	timestamp DEFAULT CURRENT_TIMESTAMP
);
CREATE TRIGGER [TR_time_AfterUpdate_ModifiedAt]
AFTER UPDATE
ON time
FOR EACH ROW
BEGIN
UPDATE time SET modified_at = CURRENT_TIMESTAMP WHERE id = old.id;
END;
