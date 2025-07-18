package router

import (
	"github.com/alerdn/order-service/app/order"
	"github.com/alerdn/order-service/app/product"
	"github.com/alerdn/order-service/app/user"
	"github.com/gin-gonic/gin"
)

func Setup(server *gin.Engine) {
	user.SetupRoutes(server)
	product.SetupRoutes(server)
	order.SetupRoutes(server)
}
