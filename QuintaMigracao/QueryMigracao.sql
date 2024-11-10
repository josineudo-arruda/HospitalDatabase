USE Hospital;

SELECT * FROM internacao;

SELECT *
FROM consulta
WHERE (YEAR(data_consulta) = 2020 OR convenio IS NOT NULL);
SELECT AVG(valor_consulta) as valor_medio
FROM consulta
WHERE (YEAR(data_consulta) = 2020 OR convenio IS NOT NULL);

INSERT INTO Internacao (data_entrada, data_prev_saida, descricao, quarto, medico, paciente)
VALUES ('2023-09-20', '2023-08-25','Cirurgia para retirar retina.', 1,'555444','2857E6');

SELECT *
FROM internacao
WHERE data_entrada > data_prev_saida;

SELECT * 
FROM Consulta 
WHERE id = (SELECT MIN(id) FROM Consulta);

SELECT * 
FROM Consulta 
WHERE valor_consulta = (SELECT MAX(valor_consulta) FROM Consulta WHERE convenio IS NULL)
   OR valor_consulta = (SELECT MIN(valor_consulta) FROM Consulta WHERE convenio IS NULL);
   
SELECT i.*, q.numero, t.valor_diaria, DATEDIFF(i.data_prev_saida, i.data_entrada) AS dias_internacao, 
   DATEDIFF(i.data_prev_saida, i.data_entrada) * t.valor_diaria AS total_internacao
FROM Internacao i
JOIN Quarto q ON i.quarto = q.id
JOIN Tipo_Quarto t ON q.tipo = t.id;

SELECT i.data_entrada, i.descricao AS procedimento, q.numero AS numero_quarto
FROM Internacao i
JOIN Quarto q ON i.quarto = q.id
JOIN Tipo_Quarto t ON q.tipo = t.id
WHERE t.tipo = 'Apartamento';

SELECT p.nome AS paciente, c.data_consulta, e.nome AS especialidade
FROM Consulta c
JOIN Paciente p ON c.paciente = p.id
JOIN Associacao_Medico_Especialidade ame ON ame.medico = c.medico
JOIN Especialidade e ON ame.especialidade = e.id
WHERE DATEDIFF(c.data_consulta, p.data_nascimento) / 365 < 18
AND e.nome != 'Pediatria'
ORDER BY c.data_consulta;

SELECT p.nome AS paciente, m.nome AS medico, i.data_entrada, i.descricao AS procedimento
FROM Internacao i
JOIN Paciente p ON i.paciente = p.id
JOIN Medico m ON i.medico = m.id
JOIN Associacao_Medico_Especialidade ame ON ame.medico = m.id
JOIN Especialidade e ON ame.especialidade = e.id
JOIN Quarto q ON i.quarto = q.id
JOIN Tipo_Quarto t ON q.tipo = t.id
WHERE e.nome = 'Gastroenterologia' AND t.tipo = 'Enfermaria';

SELECT m.nome, m.cpf AS CRM, COUNT(c.id) AS quantidade_consultas
FROM Medico m
JOIN Consulta c ON m.id = c.medico
GROUP BY m.nome, m.cpf;

SELECT * FROM Medico
WHERE nome LIKE '%Gabriel%';

SELECT e.nome, e.coren AS CRE, COUNT(i.id) AS numero_internacoes
FROM Enfermeiro e
JOIN Associacao_Internacao_Enfermeiro aie ON e.id = aie.enfermeiro
JOIN Internacao i ON aie.internacao = i.id
GROUP BY e.nome, e.coren
HAVING COUNT(i.id) > 1;