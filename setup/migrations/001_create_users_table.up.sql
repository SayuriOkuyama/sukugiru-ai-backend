CREATE TABLE IF NOT EXISTS users(
  id UUID NOT NULL
  ,name VARCHAR(256) NOT NULL
  ,deleted_at TIMESTAMP
  ,created_at TIMESTAMP NOT NULL
  ,created_user_id VARCHAR(256) NOT NULL
  ,updated_at TIMESTAMP NOT NULL
  ,updated_user_id VARCHAR(256) NOT NULL
  ,PRIMARY KEY (id)
);

COMMENT ON TABLE users IS 'ユーザー';
COMMENT ON COLUMN users.id IS 'ID';
COMMENT ON COLUMN users.name IS 'ユーザー名';
COMMENT ON COLUMN users.deleted_at IS '論理削除日時';
COMMENT ON COLUMN users.created_at IS '作成日時';
COMMENT ON COLUMN users.created_user_id IS '作成ユーザ';
COMMENT ON COLUMN users.updated_at IS '更新日時';
COMMENT ON COLUMN users.updated_user_id IS '更新ユーザ';
