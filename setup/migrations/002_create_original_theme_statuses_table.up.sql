CREATE TABLE IF NOT EXISTS original_theme_statuses(
  id UUID NOT NULL
  ,status int NOT NULL
  ,deleted_at TIMESTAMP
  ,created_at TIMESTAMP NOT NULL
  ,created_user_id VARCHAR(256) NOT NULL
  ,updated_at TIMESTAMP NOT NULL
  ,updated_user_id VARCHAR(256) NOT NULL
  ,PRIMARY KEY (id)
);

COMMENT ON TABLE original_theme_statuses IS 'オリジナルテーマ生成ステータス';
COMMENT ON COLUMN original_theme_statuses.id IS 'ID';
COMMENT ON COLUMN original_theme_statuses.status IS 'ステータス（0:完了,1:生成中,2:失敗）';
COMMENT ON COLUMN original_theme_statuses.deleted_at IS '論理削除日時';
COMMENT ON COLUMN original_theme_statuses.created_at IS '作成日時';
COMMENT ON COLUMN original_theme_statuses.created_user_id IS '作成ユーザ';
COMMENT ON COLUMN original_theme_statuses.updated_at IS '更新日時';
COMMENT ON COLUMN original_theme_statuses.updated_user_id IS '更新ユーザ';
