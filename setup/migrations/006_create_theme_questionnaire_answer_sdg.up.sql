CREATE TABLE IF NOT EXISTS theme_questionnaire_answer_sdg(
  theme_questionnaire_answer_id UUID NOT NULL
  ,sdg_id INT NOT NULL
  ,deleted_at TIMESTAMP
  ,created_at TIMESTAMP NOT NULL
  ,created_user_id VARCHAR(256) NOT NULL
  ,updated_at TIMESTAMP NOT NULL
  ,updated_user_id VARCHAR(256) NOT NULL
  ,PRIMARY KEY (theme_questionnaire_answer_id, sdg_id)
  ,CONSTRAINT fk_theme_questionnaire_answer_sdg_theme_questionnaire_answers_id FOREIGN KEY (theme_questionnaire_answer_id) REFERENCES theme_questionnaire_answers(id)
  ,CONSTRAINT fk_theme_questionnaire_answer_sdg_sdgs_id FOREIGN KEY (sdg_id) REFERENCES sdgs(id)
);

COMMENT ON TABLE theme_questionnaire_answer_sdg IS 'オリジナルテーマ事前アンケートの回答と SDGs の関連';
COMMENT ON COLUMN theme_questionnaire_answer_sdg.theme_questionnaire_answer_id IS 'オリジナルテーマ事前アンケートの回答 ID';
COMMENT ON COLUMN theme_questionnaire_answer_sdg.sdg_id IS 'SDGs ID';
COMMENT ON COLUMN theme_questionnaire_answer_sdg.deleted_at IS '論理削除日時';
COMMENT ON COLUMN theme_questionnaire_answer_sdg.created_at IS '作成日時';
COMMENT ON COLUMN theme_questionnaire_answer_sdg.created_user_id IS '作成ユーザ';
COMMENT ON COLUMN theme_questionnaire_answer_sdg.updated_at IS '更新日時';
COMMENT ON COLUMN theme_questionnaire_answer_sdg.updated_user_id IS '更新ユーザ';
