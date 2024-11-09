package datastore

import (
	"github.com/SayuriOkuyama/sukugiru-ai-backend/domain/repository"
	"github.com/dotd-inc/dothatch-backend/domain/repository"
	"gorm.io/gorm"
)

type themeRepository struct {
	db             *gorm.DB
}

func NewThemeRepository(db *gorm.DB) repository.ThemeRepository {
	return &themeRepository{db}
}
