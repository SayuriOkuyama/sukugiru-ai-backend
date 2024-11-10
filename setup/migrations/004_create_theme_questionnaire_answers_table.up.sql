CREATE TABLE IF NOT EXISTS theme_questionnaire_answers(
  id UUID NOT NULL
  ,original_theme_status_id UUID NOT NULL
  ,career_aspiration VARCHAR(256) NOT NULL
  ,career_study_years VARCHAR(256) NOT NULL
  ,sdgs_experience VARCHAR(256) NOT NULL
  ,deleted_at TIMESTAMP
  ,created_at TIMESTAMP NOT NULL
  ,created_user_id VARCHAR(256) NOT NULL
  ,updated_at TIMESTAMP NOT NULL
  ,updated_user_id VARCHAR(256) NOT NULL
  ,PRIMARY KEY (id)
  ,CONSTRAINT fk_theme_questionnaire_answers_original_theme_statuses_id FOREIGN KEY (original_theme_status_id) REFERENCES original_theme_statuses(id)
);

COMMENT ON TABLE theme_questionnaire_answers IS 'オリジナルテーマ事前アンケートの回答';
COMMENT ON COLUMN theme_questionnaire_answers.id IS 'ID';
COMMENT ON COLUMN theme_questionnaire_answers.original_theme_status_id IS 'オリジナルテーマ生成ステータスID';
COMMENT ON COLUMN theme_questionnaire_answers.career_aspiration IS '希望職種';
COMMENT ON COLUMN theme_questionnaire_answers.career_study_years IS '学習年数';
COMMENT ON COLUMN theme_questionnaire_answers.sdgs_experience IS 'SDGsに関する原体験';
COMMENT ON COLUMN theme_questionnaire_answers.deleted_at IS '論理削除日時';
COMMENT ON COLUMN theme_questionnaire_answers.created_at IS '作成日時';
COMMENT ON COLUMN theme_questionnaire_answers.created_user_id IS '作成ユーザ';
COMMENT ON COLUMN theme_questionnaire_answers.updated_at IS '更新日時';
COMMENT ON COLUMN theme_questionnaire_answers.updated_user_id IS '更新ユーザ';
