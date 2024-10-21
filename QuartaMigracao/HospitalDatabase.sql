USE Hospital;

ALTER TABLE Medico ADD COLUMN em_atividade bool NOT NULL DEFAULT true;

UPDATE Medico SET em_atividade = false WHERE id = '123456';
UPDATE Medico SET em_atividade = false WHERE id = '678368';

SELECT * FROM Medico;