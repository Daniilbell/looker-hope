# The name of this view in Looker is "Operational Routes"
view: operational_routes {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: hope.operational_routes ;;
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
  # This dimension will be called "Cascade ID" in Explore.

  dimension: cascade_id {
    type: number
    sql: ${TABLE}.cascade_id ;;
  }

  dimension: conditions {
    type: string
    sql: ${TABLE}.conditions ;;
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

  dimension: pack_id {
    type: number
    sql: ${TABLE}.pack_id ;;
  }

  dimension: pack_step {
    type: number
    sql: ${TABLE}.pack_step ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_pack_step {
    type: sum
    sql: ${pack_step} ;;
  }

  measure: average_pack_step {
    type: average
    sql: ${pack_step} ;;
  }

  dimension: ps_account_id {
    type: number
    sql: ${TABLE}.ps_account_id ;;
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
    drill_fields: [id]
  }
}
