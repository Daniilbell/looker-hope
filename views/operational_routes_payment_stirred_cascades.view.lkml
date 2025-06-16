# The name of this view in Looker is "Operational Routes Payment Stirred Cascades"
view: operational_routes_payment_stirred_cascades {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: hope.operational_routes_payment_stirred_cascades ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Payment ID" in Explore.

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension: steps {
    type: string
    sql: ${TABLE}.steps ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
