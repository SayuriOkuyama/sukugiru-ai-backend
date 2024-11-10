CREATE TABLE IF NOT EXISTS user_hobbies(
  id UUID NOT NULL
  ,theme_questionnaire_answer_id UUID NOT NULL
  ,hobby VARCHAR(256) NOT NULL
  ,deleted_at TIMESTAMP
  ,created_at TIMESTAMP NOT NULL
  ,created_user_id VARCHAR(256) NOT NULL
  ,updated_at TIMESTAMP NOT NULL
  ,updated_user_id VARCHAR(256) NOT NULL
  ,PRIMARY KEY (id)
  ,CONSTRAINT fk_user_hobbies_theme_questionnaire_answers_id FOREIGN KEY (theme_questionnaire_answer_id) REFERENCES theme_questionnaire_answers(id)
);

COMMENT ON TABLE user_hobbies IS 'オリジナルテーマ事前アンケートの回答の「趣味」';
COMMENT ON COLUMN user_hobbies.id IS 'ID';
COMMENT ON COLUMN user_hobbies.theme_questionnaire_answer_id IS 'オリジナルテーマ事前アンケートの回答 ID';
COMMENT ON COLUMN user_hobbies.hobby IS '趣味';
COMMENT ON COLUMN user_hobbies.deleted_at IS '論理削除日時';
COMMENT ON COLUMN user_hobbies.created_at IS '作成日時';
COMMENT ON COLUMN user_hobbies.created_user_id IS '作成ユーザ';
COMMENT ON COLUMN user_hobbies.updated_at IS '更新日時';
COMMENT ON COLUMN user_hobbies.updated_user_id IS '更新ユーザ';
