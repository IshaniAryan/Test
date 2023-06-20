terraform {
  required_providers {
    snowflake = {
      source  = "chanzuckerberg/snowflake"
      version = "0.25.17"
    }
  }

  backend "remote" {
    organization = "esusu-kipi"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

provider "snowflake" {
}

resource "snowflake_database" "util_db" {
  name    = "UTIL_DB"
  comment = "Database for Snowflake Terraform demo"
}

resource "snowflake_schema" "util_schema" {
  database = snowflake_database.util_db.name
  name     = "UTIL_SCHEMA"
  comment  = "Schema for Snowflake Terraform demo"
}
