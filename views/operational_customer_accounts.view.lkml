# The name of this view in Looker is "Operational Customer Accounts"
view: operational_customer_accounts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: hope.operational_customer_accounts ;;
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
  # This dimension will be called "Account Displayed Name" in Explore.

  dimension: account_displayed_name {
    type: string
    sql: ${TABLE}.account_displayed_name ;;
  }

  dimension: account_holder {
    type: string
    sql: ${TABLE}.account_holder ;;
  }

  dimension: account_number {
    type: string
    sql: ${TABLE}.account_number ;;
  }

  dimension: account_type {
    type: string
    sql: ${TABLE}.account_type ;;
  }

  dimension: attrs {
    type: string
    sql: ${TABLE}.attrs ;;
  }

  dimension: bank_code {
    type: string
    sql: ${TABLE}.bank_code ;;
  }

  dimension: bank_id {
    type: number
    sql: ${TABLE}.bank_id ;;
  }

  dimension: bank_name {
    type: string
    sql: ${TABLE}.bank_name ;;
  }

  dimension: bankcard_number_vault_token {
    type: string
    sql: ${TABLE}.bankcard_number_vault_token ;;
  }

  dimension: bankcard_vault_token {
    type: string
    sql: ${TABLE}.bankcard_vault_token ;;
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

  dimension: payment_method {
    type: string
    sql: ${TABLE}.payment_method ;;
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

  dimension_group: valid_until {
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
    sql: ${TABLE}.valid_until ;;
  }

  measure: count {
    type: count
    drill_fields: [id, account_displayed_name, bank_name]
  }
}
