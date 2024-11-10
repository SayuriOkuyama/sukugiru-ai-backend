CREATE TABLE IF NOT EXISTS original_themes(
  id UUID NOT NULL
  ,original_theme_status_id UUID NOT NULL
  ,domain VARCHAR(256) NOT NULL
  ,theme VARCHAR(256) NOT NULL
  ,user_problem VARCHAR(256) NOT NULL
  ,user_story VARCHAR(256) NOT NULL
  ,target_user_group VARCHAR(256) NOT NULL
  ,deleted_at TIMESTAMP
  ,created_at TIMESTAMP NOT NULL
  ,created_user_id VARCHAR(256) NOT NULL
  ,updated_at TIMESTAMP NOT NULL
  ,updated_user_id VARCHAR(256) NOT NULL
  ,PRIMARY KEY (id)
  ,CONSTRAINT fk_original_themes_original_theme_statuses_id FOREIGN KEY (original_theme_status_id) REFERENCES original_theme_statuses(id)
);

COMMENT ON TABLE original_themes IS 'オリジナルテーマ';
COMMENT ON COLUMN original_themes.id IS 'ID';
COMMENT ON COLUMN original_themes.original_theme_status_id IS 'オリジナルテーマ生成ステータスID';
COMMENT ON COLUMN original_themes.domain IS 'ドメイン';
COMMENT ON COLUMN original_themes.theme IS 'テーマ';
COMMENT ON COLUMN original_themes.user_problem IS 'ユーザーの想定課題';
COMMENT ON COLUMN original_themes.user_story IS 'ユーザストーリー';
COMMENT ON COLUMN original_themes.target_user_group IS '対象ユーザー層';
COMMENT ON COLUMN original_themes.deleted_at IS '論理削除日時';
COMMENT ON COLUMN original_themes.created_at IS '作成日時';
COMMENT ON COLUMN original_themes.created_user_id IS '作成ユーザ';
COMMENT ON COLUMN original_themes.updated_at IS '更新日時';
COMMENT ON COLUMN original_themes.updated_user_id IS '更新ユーザ';
