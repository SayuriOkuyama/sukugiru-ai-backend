CREATE TABLE IF NOT EXISTS sdgs(
  id INT NOT NULL
  ,name VARCHAR(256) NOT NULL
  ,deleted_at TIMESTAMP
  ,created_at TIMESTAMP NOT NULL
  ,created_user_id VARCHAR(256) NOT NULL
  ,updated_at TIMESTAMP NOT NULL
  ,updated_user_id VARCHAR(256) NOT NULL
  ,PRIMARY KEY (id)
);

COMMENT ON TABLE sdgs IS 'SDGs';
COMMENT ON COLUMN sdgs.id IS 'ID';
COMMENT ON COLUMN sdgs.name IS 'SDGs項目名';
COMMENT ON COLUMN sdgs.deleted_at IS '論理削除日時';
COMMENT ON COLUMN sdgs.created_at IS '作成日時';
COMMENT ON COLUMN sdgs.created_user_id IS '作成ユーザ';
COMMENT ON COLUMN sdgs.updated_at IS '更新日時';
COMMENT ON COLUMN sdgs.updated_user_id IS '更新ユーザ';
