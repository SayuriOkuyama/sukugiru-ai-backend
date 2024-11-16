package handler

import (
	"github.com/SayuriOkuyama/sukugiru-ai-backend/domain/repository"
	"github.com/SayuriOkuyama/sukugiru-ai-backend/usecase"
	"github.com/labstack/echo/v4"
)

type (
	// 外部から呼び出す関数の interface
	ThemeHandler interface {
		PostQuestionnaireForTheme(c echo.Context, auth bool) error
	}

	// この中だけで使う構造体
	themeHandler struct {
		// AiHandler 内で使うユースケース
		UserUseCase       usecase.ThemeUseCase
		ThemeRepository repository.ThemeRepository
	}
)

// ThemeHandler の初期化関数
func NewThemeHandler(u usecase.ThemeUseCase, t repository.ThemeRepository) ThemeHandler {
	return &themeHandler{u, t}
}

