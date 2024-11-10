package config

import "os"

type Config struct {
	Server struct {
		Port                  string
		RedirectURLAfterLogin string
	}
	Database struct {
		Host     string
		User     string
		Password string
		Database string
		Port     string
	}
	GeminiAPIKey  string
}

func NewConfig() (*Config, error) {
	var cfg Config

	current := &cfg

	current.Server.Port = os.Getenv("SERVER_PORT")
	// フロントの URI
	current.Server.RedirectURLAfterLogin = os.Getenv("SERVER_REDIRECT_URL_AFTER_LOGIN")
	// 追加
	cfg.GeminiAPIKey = os.Getenv("GEMINI_API_KEY")

	// PostgreSQL
	current.Database.Host = os.Getenv("POSTGRES_HOST")
	current.Database.User = os.Getenv("POSTGRES_USER")
	current.Database.Password = os.Getenv("POSTGRES_PASSWORD")
	current.Database.Database = os.Getenv("POSTGRES_DATABASE")
	current.Database.Port = os.Getenv("POSTGRES_PORT")

	return current, nil
}



