package router

import (
	"github.com/alerdn/order-service/app/order"
	"github.com/alerdn/order-service/app/product"
	"github.com/alerdn/order-service/app/user"
	"net/http"

	"github.com/gin-gonic/gin"
)

func Setup(server *gin.Engine) {
	user.SetupRoutes(server)
	product.SetupRoutes(server)
	order.SetupRoutes(server)

	server.GET("/", func(ctx *gin.Context) {
		ctx.JSON(http.StatusOK, gin.H{"message": "Hello, World!"})
	})
}
