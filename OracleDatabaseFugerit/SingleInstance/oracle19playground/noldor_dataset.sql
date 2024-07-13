
CREATE TABLE fugerit.person (
	id NUMBER NOT NULL,
	surname VARCHAR(256) NOT NULL,
	name VARCHAR(256) NOT NULL,
	birth_date DATE NOT NULL,
	note VARCHAR(256) NOT NULL,
	id_mother NUMBER,
	id_father NUMBER
);

ALTER TABLE fugerit.person ADD CONSTRAINT person_pk PRIMARY KEY ( id );
ALTER TABLE fugerit.person ADD CONSTRAINT person_fk1 FOREIGN KEY ( id_mother ) REFERENCES person ( id );
ALTER TABLE fugerit.person ADD CONSTRAINT person_fk2 FOREIGN KEY ( id_father ) REFERENCES person ( id );

COMMENT ON TABLE fugerit.person IS 'People data';
COMMENT ON COLUMN fugerit.person.id IS 'Person id';
COMMENT ON COLUMN fugerit.person.surname IS 'Person surname';
COMMENT ON COLUMN fugerit.person.name IS 'Person name';
COMMENT ON COLUMN fugerit.person.birth_date IS 'Person birth date';
COMMENT ON COLUMN fugerit.person.note IS 'Notes on persone';
COMMENT ON COLUMN fugerit.person.id_mother IS 'Reference to mother';
COMMENT ON COLUMN fugerit.person.id_father IS 'Reference to fater';

INSERT INTO fugerit.person VALUES ( 1, 'Therinde', 'Miriel', TO_DATE( '1900-01-01', 'YYYY-MM-DD' ), 'First wife of Finwe', NULL, NULL ); 
INSERT INTO fugerit.person VALUES ( 2, 'Noldor', 'Finwe', TO_DATE( '2000-01-01', 'YYYY-MM-DD' ), 'Noldor king', NULL, NULL ); 
INSERT INTO fugerit.person VALUES ( 3, 'Noldor', 'Feanor', TO_DATE( '2000-01-01', 'YYYY-MM-DD' ), 'Great smith', 1, 2 ); 

CREATE TABLE fugerit.document (
	id NUMBER NOT NULL,
	id_owner NUMBER NOT NULL,
	id_creator NUMBER NOT NULL,
	creation_date DATE NOT NULL,
	update_date DATE NOT NULL,
	path VARCHAR2(1024) NOT NULL,
	state NUMBER NOT NULL,
	info clob NOT NULL
);

ALTER TABLE fugerit.document ADD CONSTRAINT document_pk PRIMARY KEY ( id );
ALTER TABLE fugerit.document ADD CONSTRAINT document_fk1 FOREIGN KEY ( id_owner ) REFERENCES person ( id );
ALTER TABLE fugerit.document ADD CONSTRAINT document_fk2 FOREIGN KEY ( id_creator ) REFERENCES person ( id );

COMMENT ON TABLE fugerit.document IS 'Documents meta informations';
COMMENT ON COLUMN fugerit.document.id_owner IS 'Reference to owner';
COMMENT ON COLUMN fugerit.document.id_creator IS 'Reference to creator';
COMMENT ON COLUMN fugerit.document.creation_date IS 'Document creation time';
COMMENT ON COLUMN fugerit.document.update_date IS 'Document update time';
COMMENT ON COLUMN fugerit.document.path IS 'Documents path';
COMMENT ON COLUMN fugerit.document.info IS 'Documents info';
COMMENT ON COLUMN fugerit.document.state IS 'Document state';

INSERT INTO fugerit.document VALUES ( 10, 3, 1, TO_DATE( '2019-01-01', 'YYYY-MM-DD' ), TO_DATE( '2019-01-02', 'YYYY-MM-DD' ), 'Silmarillion', 1, 'TEST' );


CREATE TABLE fugerit.sample_map_table (
	id NUMBER NOT NULL,
	content VARCHAR2(16) NOT NULL
);

ALTER TABLE fugerit.sample_map_table ADD CONSTRAINT sample_map_table_pk PRIMARY KEY ( id );

COMMENT ON TABLE fugerit.sample_map_table IS 'Sample table mapped with different name';
COMMENT ON COLUMN fugerit.sample_map_table.id IS 'Record id';
COMMENT ON COLUMN fugerit.sample_map_table.content IS 'Record content';

INSERT INTO fugerit.sample_map_table VALUES ( 1, 'Mapped table' ); 
