-- Prendere tutti i dipartimenti

SELECT `id`, `name`, `level`
FROM `degrees`;

-- Selezionare tutti gli insegnanti
SELECT *
FROM `teachers`;


-- Selezionare tutti i referenti per ogni dipartimento
SELECT `id`, `name`, `head_of_department` AS `referente`
FROM `departments`;


-- Selezionare tutti insegnanti che hanno il nome Noemi
SELECT *
FROM `teachers`
WHERE `name` = "Noemi";


-- Selezionare tutti gli studenti che si sono iscritti nel 2021
SELECT *
FROM `students`
WHERE `enrolment_date` >= "2021-01-01" 
AND `enrolment_date` <= "2021-12-31"
ORDER BY `enrolment_date` DESC;


SELECT *
FROM `students`
WHERE `enrolment_date` BETWEEN "2021-01-01"  AND "2021-12-31"
ORDER BY `enrolment_date` DESC;

SELECT *
FROM `students`
WHERE YEAR(`enrolment_date`) = 2021 
ORDER BY `enrolment_date` DESC;


SELECT *
FROM `students`
WHERE `enrolment_date` LIKE "2021-%" 
ORDER BY `enrolment_date` DESC;


-- elezionare tutti gli studenti il cui nome inizia per "E" (373)
SELECT *
FROM `students`
WHERE `name` LIKE "E%"
ORDER BY `name` DESC;

-- Selezionare tutti i corsi che non hanno un sito web (676)
SELECT *
FROM `courses`
WHERE `website` IS NULL;

-- Selezionare tutti gli insegnanti che hanno un numero di telefono (50)
SELECT *
FROM `teachers`
WHERE `phone` IS NOT NULL

-- Selezionare tutti gli appelli d'esame dei mesi di giugno e luglio 2020 (2634)
SELECT *, MONTH(`date`)
FROM `exams`
WHERE MONTH(`date`) = 6 
OR MONTH(`date`) = 7
AND YEAR(`date`) = 2020
ORDER BY `date` DESC

-- Qual è il numero totale degli studenti iscritti? (5000)
SELECT COUNT(*) AS `totale_iscritti`
FROM `students`


-- Voto medio per ogni appello d'esame
SELECT `exam_id`, AVG(`vote`)
FROM `exam_student`
GROUP BY `exam_id`

-- Contare gli studenti raggruppati per anno di nascita
SELECT YEAR(`date_of_birth`), COUNT(`id`)
FROM `students`
GROUP BY YEAR(`date_of_birth`)
ORDER BY YEAR(`date_of_birth`)


-- Contare gli appelli d'esame del mese di luglio raggruppati per giorno
SELECT DAY(`date`) AS `giorno`, COUNT(`id`)
FROM `exams`
WHERE MONTH(`date`) = 7
GROUP BY DAY(`date`)
ORDER BY `giorno`