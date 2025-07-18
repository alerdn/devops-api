package messenger

import (
	"os"

	amqp "github.com/rabbitmq/amqp091-go"
)

type Messenger struct {
	channel *amqp.Channel
}

var MessengerInstance = &Messenger{}

func Setup() {
	conn, err := amqp.Dial(os.Getenv("RABBITMQ_DNS_GO"))
	if err != nil {
		panic("failed to connect to RabbitMQ: " + err.Error())
	}

	MessengerInstance.channel, err = conn.Channel()
	if err != nil {
		panic("failed to open a channel: " + err.Error())
	}
}

func (m *Messenger) PublishOrderCreated(data amqp.Publishing) error {
	queue, err := MessengerInstance.channel.QueueDeclare("order_queue", false, false, false, false, nil)
	if err != nil {
		panic("failed to declare a queue: " + err.Error())
	}

	return m.channel.Publish("", queue.Name, false, false, data)
}
