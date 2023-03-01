output "mongo_db_id" {
  description = "The ID of the Cosmos DB Mongo Database."
  value       = azurerm_cosmosdb_mongo_database.this.id
}