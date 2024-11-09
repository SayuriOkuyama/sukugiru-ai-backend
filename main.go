package main

import (
	"net/http"
	"os"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	echoSwagger "github.com/swaggo/echo-swagger"
)

type Config struct {
	Server struct {
		Port                  string
		RedirectURLAfterLogin string
	}
	GeminiAPIKey  string
}

func main() {
	// 環境変数取得
	env := os.Getenv("GO_ENV")

	// Echoのインスタンス作成
	e := echo.New()

	e.Use(middleware.Logger())

	var cfg Config
	current := &cfg
	current.Server.Port = os.Getenv("SERVER_PORT")
	// フロントの URI
	current.Server.RedirectURLAfterLogin = os.Getenv("SERVER_REDIRECT_URL_AFTER_LOGIN")
	// 追加
	cfg.GeminiAPIKey = os.Getenv("GEMINI_API_KEY")

	// 本番環境以外の場合はデバッグモードを有効にする
	isDebug := env == "local" || env == "dev" || env == "qa"

	// local, dev, qa 環境の場合はデバッグモードを有効にする
	if isDebug {
		// デバッグモードの場合は echo のデバッグを true にする
		e.Debug = isDebug
		// swaggerの設定
		e.GET("/swagger/*", echoSwagger.WrapHandler)
		// CORSミドルウェアを追加
		e.Use(middleware.CORSWithConfig(middleware.CORSConfig{
			AllowOrigins:     []string{"http://localhost:3000"},
			AllowCredentials: true,
		}))
		// ローカル環境検証用：トークンを払い出す
		// e.GET("/token/:userId", h.GetToken)
	} else {
		// 本番環境の場合は CORS を許可する
		e.Use(middleware.CORSWithConfig(middleware.CORSConfig{
			AllowCredentials: true,
		}))
	}

	e.GET("/", func(c echo.Context) error {
			return c.String(http.StatusOK, "ʕ◔ϖ◔ʔ")
	})

	e.Logger.Fatal(e.Start(":8080"))
}
