CREATE TABLE IF NOT EXISTS solution_hints(
  id UUID NOT NULL
  ,original_themes_id UUID NOT NULL
  ,solution_hint VARCHAR(256) NOT NULL
  ,deleted_at TIMESTAMP
  ,created_at TIMESTAMP NOT NULL
  ,created_user_id VARCHAR(256) NOT NULL
  ,updated_at TIMESTAMP NOT NULL
  ,updated_user_id VARCHAR(256) NOT NULL
  ,PRIMARY KEY (id)
  ,CONSTRAINT fk_original_themes_solution_hints_id FOREIGN KEY (original_themes_id) REFERENCES original_themes(id)
);

COMMENT ON TABLE solution_hints IS 'オリジナルテーマ事前アンケートの回答の「解決策のヒント」';
COMMENT ON COLUMN solution_hints.id IS 'ID';
COMMENT ON COLUMN solution_hints.original_themes_id IS 'オリジナルテーマ事前アンケートの回答 ID';
COMMENT ON COLUMN solution_hints.solution_hint IS '解決策のヒント';
COMMENT ON COLUMN solution_hints.deleted_at IS '論理削除日時';
COMMENT ON COLUMN solution_hints.created_at IS '作成日時';
COMMENT ON COLUMN solution_hints.created_user_id IS '作成ユーザ';
COMMENT ON COLUMN solution_hints.updated_at IS '更新日時';
COMMENT ON COLUMN solution_hints.updated_user_id IS '更新ユーザ';
