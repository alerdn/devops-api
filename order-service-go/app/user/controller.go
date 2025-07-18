package user

import (
	"net/http"

	"github.com/alerdn/order-service/database"
	"github.com/gin-gonic/gin"
)

type UserController struct{}

func (uc *UserController) GetUsers(c *gin.Context) {
	var users []User

	database.DB.Find(&users)

	c.JSON(http.StatusOK, gin.H{
		"users": users,
	})
}

func (uc *UserController) CreateUser(c *gin.Context) {
	var user User

	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{
			"error": err.Error(),
		})
		return
	}

	database.DB.Create(&user)
	c.JSON(http.StatusCreated, gin.H{
		"user": user,
	})
}
