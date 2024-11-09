package usecase

func(t *themeUseCase) CreateOriginalTheme() error {
	return t.ThemeRepository.CreateOriginalTheme()
}
