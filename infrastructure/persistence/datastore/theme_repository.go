package datastore

import (
	"github.com/SayuriOkuyama/sukugiru-ai-backend/domain/repository"
	"gorm.io/gorm"
)

type themeRepository struct {
	db             *gorm.DB
}

func NewThemeRepository(db *gorm.DB) repository.ThemeRepository {
	return &themeRepository{db}
}
