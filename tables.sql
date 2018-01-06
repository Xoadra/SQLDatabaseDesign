



SELECT *
FROM characters;

INSERT INTO characters VALUES('Xoxaa', 16, 'Female', 'Xoavyx');
INSERT INTO characters VALUES
	('Krongyrm', 16, 'Male', 'Kobyriab'),
    ('Irecca', 14, 'Female', 'Irratari')
;
INSERT INTO characters VALUES('Siddhryth', 17, 'Male', '');

UPDATE characters
SET race = 'Umbrygn'
WHERE nameof = 'Siddhryth' AND age = 17;

INSERT INTO characters VALUES('Morheigjr', 18, 'Male', 'Kobyriab');

ALTER TABLE characters
ALTER COLUMN age SET DEFAULT 0;

ALTER TABLE characters
ALTER COLUMN race SET DEFAULT 'Unknown';

INSERT INTO characters VALUES('Welkievel', 17, 'Male', DEFAULT);

ALTER TABLE characters
ADD tier VARCHAR(1);

UPDATE characters
SET tier = 'E'
WHERE nameof = 'Xoxaa';

DELETE FROM characters
WHERE nameof = 'Welkievel';

ALTER TABLE characters DROP tier;

DROP DATABASE xoxaa;


