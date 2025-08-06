package main

import (
	// "github.com/alerdn/order-service/app/order"
	// "github.com/alerdn/order-service/app/product"
	// "github.com/alerdn/order-service/app/user"
	// "github.com/alerdn/order-service/database"
	// "github.com/alerdn/order-service/messenger"
	"github.com/alerdn/order-service/router"
	"github.com/gin-gonic/gin"
)

func main() {
	// database.Setup()
	// messenger.Setup()

	// user.Migrate(database.DB)
	// product.Migrate(database.DB)
	// order.Migrate(database.DB)

	server := gin.Default()
	router.Setup(server)
	server.Run(":3000")
}
