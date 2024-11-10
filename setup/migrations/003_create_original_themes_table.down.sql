ALTER TABLE original_themes
DROP CONSTRAINT fk_theme_questionnaire_answers_original_theme_statuses_id IF EXISTS;

ALTER TABLE original_themes
DROP CONSTRAINT fk_original_themes_solution_hints_id IF EXISTS;

DROP TABLE IF EXISTS original_themes;
