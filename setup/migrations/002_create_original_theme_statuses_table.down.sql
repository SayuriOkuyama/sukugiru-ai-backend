ALTER TABLE original_theme_statuses
DROP CONSTRAINT fk_original_themes_original_theme_statuses_id IF EXISTS;

DROP TABLE IF EXISTS original_theme_statuses;
