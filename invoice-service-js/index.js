require("dotenv").config();
const amqp = require("amqplib/callback_api");
const database = require("./database");

amqp.connect(process.env.RABBITMQ_DNS_JS, (error0, connection) => {
  if (error0) {
    throw error0;
  }

  connection.createChannel((error1, channel) => {
    if (error1) {
      throw error1;
    }

    const queue = "order_queue";

    channel.assertQueue(queue, {
      durable: false,
    });

    console.log(`Waiting for messages in ${queue}. To exit press CTRL+C`);

    channel.consume(
      queue,
      async (msg) => {
        const body = JSON.parse(msg.content.toString());
        console.log("Received:", body);

        const result = await database.insert(body).into("invoice");
        console.log("Inserted into database:", result);
      },
      {
        noAck: true,
      }
    );
  });
});
