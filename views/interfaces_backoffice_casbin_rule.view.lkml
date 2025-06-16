# The name of this view in Looker is "Interfaces Backoffice Casbin Rule"
view: interfaces_backoffice_casbin_rule {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: hope.interfaces_backoffice_casbin_rule ;;
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
  # This dimension will be called "Ptype" in Explore.

  dimension: ptype {
    type: string
    sql: ${TABLE}.ptype ;;
  }

  dimension: v0 {
    type: string
    sql: ${TABLE}.v0 ;;
  }

  dimension: v1 {
    type: string
    sql: ${TABLE}.v1 ;;
  }

  dimension: v2 {
    type: string
    sql: ${TABLE}.v2 ;;
  }

  dimension: v3 {
    type: string
    sql: ${TABLE}.v3 ;;
  }

  dimension: v4 {
    type: string
    sql: ${TABLE}.v4 ;;
  }

  dimension: v5 {
    type: string
    sql: ${TABLE}.v5 ;;
  }

  measure: count {
    type: count
    drill_fields: [id]
  }
}
