package main

import (
	"net/http"

	"github.com/labstack/echo/v4"
	"github.com/labstack/echo/v4/middleware"
)

func main() {
    e := echo.New()

		    // CORSミドルウェアを追加
				e.Use(middleware.CORSWithConfig(middleware.CORSConfig{
					AllowOrigins: []string{"http://localhost:3000"},
					AllowMethods: []string{echo.GET, echo.HEAD, echo.PUT, echo.PATCH, echo.POST, echo.DELETE},
			}))

    e.GET("/", func(c echo.Context) error {
        return c.String(http.StatusOK, "ʕ◔ϖ◔ʔ")
    })

    e.Logger.Fatal(e.Start(":8080"))
}
