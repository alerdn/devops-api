package order

import "github.com/gin-gonic/gin"

func SetupRoutes(router *gin.Engine) {
	orderController := &OrderController{}

	router.GET("/orders", orderController.GetOrders)
	router.POST("/orders", orderController.CreateOrder)
}
