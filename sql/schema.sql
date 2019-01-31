DROP TABLE IF EXISTS m_block;
CREATE TABLE m_block (
	id 				integer PRIMARY KEY,
	name 			varchar
);

DROP TABLE IF EXISTS entry;
CREATE TABLE entry (
	id 				integer PRIMARY KEY,
	name 			varchar
);

DROP TABLE IF EXISTS block;
CREATE TABLE block (
	id 				integer PRIMARY KEY,
	entry_id 		integer NOT NULL REFERENCES entry(id),
	m_block_id 		integer NOT NULL REFERENCES m_block(id),
	payload 		text,
	media 			varchar
);

DROP TABLE IF EXISTS grouping;
CREATE TABLE grouping (
	id 				integer PRIMARY KEY,
	name 			varchar
);

DROP TABLE IF EXISTS entry_grouping;
CREATE TABLE entry_grouping (
	id 				integer PRIMARY KEY,
	entry_id 		integer NOT NULL REFERENCES entry(id),
	grouping_id 	integer NOT NULL REFERENCES grouping(id)
);

DROP TABLE IF EXISTS grouping_keyword;
CREATE TABLE grouping_keyword (
	id 				integer PRIMARY KEY,
	grouping_id 	integer NOT NULL REFERENCES grouping(id),
	keyword 		text
);

DROP TABLE IF EXISTS tag;
CREATE TABLE tag (
	id 				integer PRIMARY KEY,
	name 			varchar
);

DROP TABLE IF EXISTS grouping_tag;
CREATE TABLE grouping_tag (
	id 				integer PRIMARY KEY,
	grouping_id 	integer NOT NULL REFERENCES grouping(id),
	tag_id 			integer NOT NULL REFERENCES tag(id)
);

DROP TABLE IF EXISTS tag_keyword;
CREATE TABLE tag_keyword (
	id 				integer PRIMARY KEY,
	tag_id 			integer NOT NULL REFERENCES tag(id),
	keyword 		text
);

DROP TABLE IF EXISTS nested_tag;
CREATE TABLE nested_tag (
	id 				integer PRIMARY KEY,
	tag_id 			integer NOT NULL REFERENCES tag(id),
	lft 			integer,
	rgt 			integer
);

DROP TABLE IF EXISTS entity;
CREATE TABLE entity (
	id 				integer PRIMARY KEY,
	tag_id 			integer NOT NULL REFERENCES tag(id),
	category 		integer
);

DROP TABLE IF EXISTS location;
CREATE TABLE location (
	id 				integer PRIMARY KEY,
	tag_id 			integer NOT NULL REFERENCES tag(id),
	category 		integer
);

DROP TABLE IF EXISTS entity_location;
CREATE TABLE entity_location (
	id 				integer PRIMARY KEY,
	entity_id 		integer NOT NULL REFERENCES entity(id),
	location_id 	integer NOT NULL REFERENCES location(id),
	start 			datetime,
	end 			datetime
);

DROP TABLE IF EXISTS purpose;
CREATE TABLE purpose (
	id 				integer PRIMARY KEY,
	tag_id 			integer NOT NULL REFERENCES tag(id),
	category 		integer
);

DROP TABLE IF EXISTS subject;
CREATE TABLE subject (
	id 				integer PRIMARY KEY,
	tag_id 			integer NOT NULL REFERENCES tag(id),
	category 		integer
);

DROP TABLE IF EXISTS time;
CREATE TABLE time (
	id 				integer PRIMARY KEY,
	tag_id 			integer NOT NULL REFERENCES tag(id),
	category 		integer,
	start 			datetime,
	end 			datetime 
);
