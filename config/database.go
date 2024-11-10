package config

import (
	"fmt"
	"log"
	"os"
	"time"

	"github.com/SayuriOkuyama/sukugiru-ai-backend/domain/common"
	"gorm.io/driver/postgres"
	"gorm.io/gorm"
	"gorm.io/gorm/logger"
)

func NewDBConnection(cfg *Config) *gorm.DB {
	return getPostgreSQLConn(cfg)
}

func getPostgreSQLConn(cfg *Config) *gorm.DB {
	dsn := fmt.Sprintf(
		"host=%s user=%s password=%s database=%s port=%s",
		cfg.Database.Host,
		cfg.Database.User,
		cfg.Database.Password,
		cfg.Database.Database,
		cfg.Database.Port,
	)

	env := os.Getenv("GO_ENV")

	// qa 環境は dev とDBインスタンス同居のため、同じシークレットを利用する
	if env == "qa" {
		env = "dev"
	}

	gormConfig := gorm.Config{}
	// ローカル環境の場合
	if env == common.LocalENV {
		// GORM のロガーを初期化
		gormConfig.Logger = logger.New(
			log.New(
				os.Stdout, // 出力先に標準出力（os.Stdout）を指定
				"\r\n", // 改行文字
				log.LstdFlags, // 日付と時刻を含む標準的なログフォーマットを指定
			),
			logger.Config{ // 詳細設定
				SlowThreshold:             time.Second, // 1秒以上かかるSQLクエリを「遅いクエリ」として扱う
				LogLevel:                  logger.Info, // 情報レベルのログを出力(SQLクエリも含む)
				IgnoreRecordNotFoundError: false, 		 // レコードが見つからない場合のエラーを無視しない
				Colorful:                  true, 			 // カラー出力を有効にする
			},
		)
	}

	// ローカル環境以外の場合
	// if env != common.LocalENV {
	// 	dbRootCert := "path to ca-cert" // CA証明書
	// 	dbCert := "path to client-cert" // クライアント証明書
	// 	dbKey := "path to client-key" // クライアント秘密鍵

	// 	// SSL接続用の設定を追加
	// 	dsn += fmt.Sprintf(" sslmode=require sslrootcert=%s sslcert=%s sslkey=%s",
	// 		dbRootCert, dbCert, dbKey)
	// }

	// GORM で PostgreSQL に接続
	conn, err := gorm.Open(postgres.Open(dsn), &gormConfig)
	if err != nil {
		panic(err)
	}

	return conn
}
