package handler

type (
	AppHandler interface {
		ThemeHandler
	}

	appHandler struct {
		ThemeHandler
	}
)

func NewAppHandler(
	t ThemeHandler,
) AppHandler {
	appHandler := &appHandler{}
	appHandler.ThemeHandler = t

	return appHandler
}
