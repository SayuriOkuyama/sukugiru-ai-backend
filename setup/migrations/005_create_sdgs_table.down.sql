ALTER TABLE sdgs
DROP CONSTRAINT fk_theme_questionnaire_answer_sdg_sdgs_id IF EXISTS;

DROP TABLE IF EXISTS sdgs;
