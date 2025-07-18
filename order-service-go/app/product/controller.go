package product

import (
	"net/http"

	"github.com/alerdn/order-service/database"
	"github.com/gin-gonic/gin"
)

type ProductController struct{}

func (pc *ProductController) GetProducts(c *gin.Context) {
	var products []Product

	database.DB.Find(&products)

	c.JSON(http.StatusOK, gin.H{"products": products})
}

func (pc *ProductController) CreateProduct(c *gin.Context) {
	var product Product
	if err := c.ShouldBindJSON(&product); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	database.DB.Create(&product)

	c.JSON(http.StatusCreated, gin.H{"product": product})
}
