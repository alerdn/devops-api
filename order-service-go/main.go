package main

import (
	"log/slog"

	"github.com/alerdn/order-service/app/order"
	"github.com/alerdn/order-service/app/product"
	"github.com/alerdn/order-service/app/user"
	"github.com/alerdn/order-service/database"

	// "github.com/alerdn/order-service/messenger"
	"github.com/alerdn/order-service/router"
	"github.com/gin-gonic/gin"
)

func main() {
	database.Setup()
	// messenger.Setup()

	slog.Info("Migrações do banco de dados...")
	user.Migrate(database.DB)
	product.Migrate(database.DB)
	order.Migrate(database.DB)

	server := gin.Default()
	router.Setup(server)
	server.Run(":3000")
}
