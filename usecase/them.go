package usecase

import (
	"github.com/SayuriOkuyama/sukugiru-ai-backend/domain/repository"
)

type (
	ThemeUseCase interface {
		CreateOriginalTheme() error
	}

	themeUseCase struct {
		repository.ThemeRepository
	}
)

func NewThemeUseCase(t repository.ThemeRepository) ThemeUseCase {
	return &themeUseCase{t}
}
