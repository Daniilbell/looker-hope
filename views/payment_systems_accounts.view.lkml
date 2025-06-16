# The name of this view in Looker is "Payment Systems Accounts"
view: payment_systems_accounts {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: hope.payment_systems_accounts ;;
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

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: payment_system_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.payment_system_id ;;
  }

  dimension: settings {
    type: string
    sql: ${TABLE}.settings ;;
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
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      name,
      payment_systems.id,
      payment_systems.name,
      checkout_hope_payments.count,
      operational_operations.count,
      operational_payments.count,
      ps_bnpay_operations.count,
      ps_forta_operations.count,
      ps_ironpay_operations.count,
      ps_payscrow_operations.count,
      ps_tradex_operations.count
    ]
  }
}
