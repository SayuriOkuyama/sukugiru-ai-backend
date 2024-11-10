package interactor

import (
	"github.com/SayuriOkuyama/sukugiru-ai-backend/domain/repository"
	"github.com/SayuriOkuyama/sukugiru-ai-backend/infrastructure/persistence/datastore"
	"github.com/SayuriOkuyama/sukugiru-ai-backend/presentation/http/handler"
	"github.com/SayuriOkuyama/sukugiru-ai-backend/usecase"
	"gorm.io/gorm"
)

type (
	Interactor interface {
		NewAppHandler() handler.AppHandler
		NewThemeHandler() handler.ThemeHandler
		NewThemeUseCase() usecase.ThemeUseCase
	}

	interactor struct {
		db             *gorm.DB
		geminiAPIKey     string // TODO: geminiAPIKey の型に修正する
	}
)

func NewInteractor(
	db *gorm.DB,
	gk string, // TODO: geminiAPIKey に修正する
) Interactor {
	return &interactor{
		db,
		gk,
	}
}

// handler をまとめる構造体
type appHandler struct {
	handler.ThemeHandler
}

// AppHandler の初期化関数
// 各 handler の初期化関数を呼び出して、AppHandler を返す
func (i *interactor) NewAppHandler() handler.AppHandler {
	appHandler := &appHandler{}
	appHandler.ThemeHandler = i.NewThemeHandler()

	return appHandler
}

func (i *interactor) NewThemeHandler() handler.ThemeHandler {
	return handler.NewThemeHandler(
		i.NewThemeUseCase(),
		i.NewThemeRepository(),
	)
}

func (i *interactor) NewThemeUseCase() usecase.ThemeUseCase {
	return usecase.NewThemeUseCase(i.NewThemeRepository())
}

func (i *interactor) NewThemeRepository() repository.ThemeRepository {
	return datastore.NewThemeRepository(i.db)
}
