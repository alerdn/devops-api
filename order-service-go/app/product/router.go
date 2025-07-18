package product

import "github.com/gin-gonic/gin"

func SetupRoutes(server *gin.Engine) {
	productController := ProductController{}

	server.GET("/products", productController.GetProducts)
	server.POST("/products", productController.CreateProduct)
}
