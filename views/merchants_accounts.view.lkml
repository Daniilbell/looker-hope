# The name of this view in Looker is "Merchants Accounts"
view: merchants_accounts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: hope.merchants_accounts ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "API Credentials Code" in Explore.

  dimension: api_credentials_code {
    type: string
    sql: ${TABLE}.api_credentials_code ;;
  }

  dimension: api_provider {
    type: string
    sql: ${TABLE}.api_provider ;;
  }

  dimension: api_token {
    type: string
    sql: ${TABLE}.api_token ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by {
    type: string
    sql: ${TABLE}.created_by ;;
  }

  dimension: is_test {
    type: yesno
    sql: ${TABLE}.is_test ;;
  }

  dimension: merchant_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: settings {
    type: string
    sql: ${TABLE}.settings ;;
  }

  dimension: is_mixed_payment_method{
    type: string
    sql:CONVERT(
          CAST(
            JSON_UNQUOTE(
              JSON_EXTRACT(CONVERT(settings USING utf8mb4), '$.is_mixed_payment_method')
            ) AS BINARY
          ) USING utf8mb4
        );;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: updated_by {
    type: string
    sql: ${TABLE}.updated_by ;;
  }

  measure: count {
    type: count
    drill_fields: [id, name, merchants.id, merchants.name]
  }
}
