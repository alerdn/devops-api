package user

import "github.com/gin-gonic/gin"

func SetupRoutes(server *gin.Engine) {
	userController := UserController{}

	server.GET("/users", userController.GetUsers)
	server.POST("/users", userController.CreateUser)
}
