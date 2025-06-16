# The name of this view in Looker is "Dictionary Errors"
view: dictionary_errors {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: hope.dictionary_errors ;;
  drill_fields: [id]
  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
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

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Integration Code" in Explore.

  dimension: integration_code {
    type: string
    sql: ${TABLE}.integration_code ;;
  }

  dimension: integration_message {
    type: string
    sql: ${TABLE}.integration_message ;;
  }

  dimension: payment_systems_api_code {
    type: string
    sql: ${TABLE}.payment_systems_api_code ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: ps_result_code {
    type: string
    sql: ${TABLE}.ps_result_code ;;
  }

  dimension: ps_result_message {
    type: string
    sql: ${TABLE}.ps_result_message ;;
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

  measure: count {
    type: count
    drill_fields: [id]
  }
}
