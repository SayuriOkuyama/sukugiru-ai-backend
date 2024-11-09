package handler

import (
	"github.com/labstack/echo/v4"
)

func (h *themeHandler) PostQuestionnaireForTheme(c echo.Context, auth bool) error {
	return h.UserUseCase.CreateOriginalTheme()
}
