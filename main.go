package main

import (
	"log"
	"net/http"
	"os"

	"github.com/SayuriOkuyama/sukugiru-ai-backend/config"
	"github.com/SayuriOkuyama/sukugiru-ai-backend/interactor"
	"github.com/joho/godotenv"
	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
	echoSwagger "github.com/swaggo/echo-swagger"
)

func init() {
	if err := godotenv.Load("config/local.env"); err != nil {
			log.Printf("No .env file found")
	}
}

func main() {
	// 環境変数取得
	env := os.Getenv("GO_ENV")

	// Echoのインスタンス作成
	e := echo.New()

	e.Use(middleware.Logger())

	cfg, err := config.NewConfig()
	if err != nil {
		e.Logger.Error("config error")

		return
	}

	// Vercel Edge Config
	edgeConfig := config.NewEdgeConfig(cfg.EdgeConfig.APIKey, cfg.EdgeConfig.Token)

	conn := config.NewDBConnection(cfg)

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
		e.Use(middleware.CORSWithConfig(middleware.CORSConfig{
			AllowCredentials: true,
		}))
	}

	i := interactor.NewInteractor(
		conn,
		cfg.GeminiAPIKey,
		edgeConfig,
	)
	h := i.NewAppHandler()

	e.GET("/", func(c echo.Context) error {
			return c.String(http.StatusOK, "ʕ◔ϖ◔ʔ")
	})
	e.POST("/contest/prototyping1/originaltheme/generate",func(c echo.Context) error {
		return h.PostQuestionnaireForTheme(c, false)
	})

	e.Logger.Fatal(e.Start(":8080"))
}
