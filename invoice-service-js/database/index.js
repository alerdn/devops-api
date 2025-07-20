const path = require("path");

const knex = require("knex")({
  client: "mysql2",
  connection: {
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
  },
  migrations: {
    directory: path.resolve(__dirname, "migrations"),
  },
});

knex.migrate
  .latest()
  .then(() => {
    console.log("Database migration completed successfully.");
  })
  .catch((error) => {
    console.error("Error during database migration:", error);
  });

module.exports = knex;
