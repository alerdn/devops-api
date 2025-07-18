package order

import (
	"encoding/json"
	"net/http"

	"github.com/alerdn/order-service/database"
	"github.com/alerdn/order-service/messenger"
	"github.com/gin-gonic/gin"
	amqp "github.com/rabbitmq/amqp091-go"
)

type OrderController struct{}

func (oc *OrderController) GetOrders(c *gin.Context) {
	var orders []Order

	database.DB.Find(&orders)

	c.JSON(http.StatusOK, gin.H{"orders": orders})
}

func (oc *OrderController) CreateOrder(c *gin.Context) {
	var order Order

	if err := c.ShouldBindJSON(&order); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	database.DB.Create(&order)

	body := make(map[string]any)
	database.DB.Raw("select u.name customer_name, p.name product_name from user u, product p, `order` o WHERE o.id = ?", order.ID).Scan(&body)

	bodyStr, _ := json.Marshal(body)

	messenger.MessengerInstance.PublishOrderCreated(amqp.Publishing{
		ContentType: "application/json",
		Body:        bodyStr,
	})

	c.JSON(http.StatusCreated, gin.H{"order": order})
}
