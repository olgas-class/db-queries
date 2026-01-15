-- Selezionare tutti i corsi del Corso di Laurea in Informatica (22)

SELECT `courses`.*, `degrees`.name AS `degree_name`
FROM `courses`
INNER JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Informatica"

-- Selezionare a quale dipartimento appartiene il Corso di Laurea in Diritto dell'Economia
SELECT *
FROM `departments`
INNER JOIN `degrees`
ON `departments`.`id` = `degrees`.`department_id`
WHERE `degrees`.`name` = "Corso di Laurea in Diritto dell'Economia"

-- Selezionare tutti i docenti che insegnano nel Corso di Laurea in Lettere (21)
SELECT DISTINCT `teachers`.*, `degrees`.`name` AS `degree_name`
FROM `teachers`
INNER JOIN `course_teacher`
ON `teachers`.`id` = `course_teacher`.`teacher_id`
INNER JOIN `courses`
ON `courses`.`id` = `course_teacher`.`course_id`
INNER JOIN `degrees`
ON `courses`.`degree_id` = `degrees`.`id`
WHERE `degrees`.`name` = "Corso di Laurea in Lettere"
ORDER BY `surname`, `teachers`.`name`

-- Selezionare il libretto universitario di Mirco Messina (matricola n. 620320)

-- materia | data | cfu | voto | 

SELECT `courses`.`name`, `exams`.`date`, `courses`.`cfu`, `exam_student`.`vote`
FROM `students`
INNER JOIN `exam_student`
ON `students`.`id` = `exam_student`.`student_id`
INNER JOIN `exams` 
ON `exams`.`id` = `exam_student`.`exam_id`
INNER JOIN `courses`
ON `courses`.`id` = `exams`.`course_id`
WHERE `students`.`registration_number` = 620320
AND `exam_student`.`vote` >= 18
ORDER BY `courses`.`name`


-- Selezionare il voto medio di superamento d'esame per ogni corso, con anche i dati
-- del corso di laurea associato, ordinati per media voto decrescente

-- nome_corso | voto_medio | corso_laurea 

SELECT  `courses`.`id`,`courses`.`name`, AVG(`exam_student`.`vote`), `degrees`.`name`
FROM `degrees`
INNER JOIN `courses`
ON `degrees`.`id` = `courses`.`degree_id`
INNER JOIN `exams`
ON `courses`.`id` = `exams`.`course_id`
INNER JOIN `exam_student`
ON `exams`.`id` = `exam_student`.`exam_id`
WHERE `exam_student`.`vote` >= 18
GROUP BY `courses`.`id`
ORDER BY AVG(`exam_student`.`vote`) DESC