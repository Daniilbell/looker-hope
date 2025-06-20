# The name of this view in Looker is "Operational Operations"
view: operational_operations {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: hope.operational_operations ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Amount" in Explore.

  dimension: amount {
    type: number
    sql: ${TABLE}.amount ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_amount {
    type: sum
    sql: ${amount} ;;
  }

  measure: average_amount {
    type: average
    sql: ${amount} ;;
  }

  dimension: amount_processed {
    type: number
    sql: ${TABLE}.amount_processed ;;
  }

  dimension: checkout_service {
    type: string
    sql: ${TABLE}.checkout_service ;;
  }

  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      minute5,
      minute30,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: customer_account_id {
    type: number
    sql: ${TABLE}.customer_account_id ;;
  }

  dimension: customer_id {
    type: number
    sql: ${TABLE}.customer_id ;;
  }

  dimension: data {
    type: string
    sql: ${TABLE}.data ;;
  }

  dimension: data_hash {
    type: number
    sql: ${TABLE}.data_hash ;;
  }

  dimension: interface_type {
    type: string
    sql: ${TABLE}.interface_type ;;
  }

  dimension: is_test {
    type: yesno
    sql: ${TABLE}.is_test ;;
  }

  dimension: merchant_account_id {
    type: number
    sql: ${TABLE}.merchant_account_id ;;
  }

  dimension: merchant_api_code {
    type: string
    sql: ${TABLE}.merchant_api_code ;;
  }

  dimension: merchant_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.merchant_id ;;
  }

  dimension: merchant_payment_id {
    type: string
    sql: ${TABLE}.merchant_payment_id ;;
  }

  dimension: operation_id {
    type: number
    sql: ${TABLE}.operation_id ;;
  }

  dimension: operation_type {
    type: string
    sql: ${TABLE}.operation_type ;;
  }

  dimension: payment_id {
    type: number
    sql: ${TABLE}.payment_id ;;
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}.payment_method ;;
  }

  dimension: payment_systems_account_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.payment_systems_account_id ;;
  }

  dimension: payment_systems_account_name {
    type: string
    sql: CASE
            WHEN ${payment_systems_account_id} = 3 THEN 'Tradex test'
            WHEN ${payment_systems_account_id} = 5 THEN 'Tradex Prod'
            WHEN ${payment_systems_account_id} = 7 THEN 'Bnpay Prod'
            WHEN ${payment_systems_account_id} = 9 THEN 'Ironpay Prod'
            WHEN ${payment_systems_account_id} = 11 THEN 'Payscrow Prod'
            WHEN ${payment_systems_account_id} = 13 THEN 'Tradex test card-p2p'
            WHEN ${payment_systems_account_id} = 15 THEN 'Forta Prod'
            WHEN ${payment_systems_account_id} = 17 THEN 'Tradex test sbp-p2p-int'
            WHEN ${payment_systems_account_id} = 19 THEN 'Tradex Card P2P PROD'
            WHEN ${payment_systems_account_id} = 21 THEN 'Tradex QR PROD'
        ELSE null
        END ;;
  }

  dimension: payment_systems_api_code {
    type: string
    sql: ${TABLE}.payment_systems_api_code ;;
  }

  dimension: payment_systems_operation_id {
    type: string
    sql: ${TABLE}.payment_systems_operation_id ;;
  }

  dimension: payment_type {
    type: string
    sql: ${TABLE}.payment_type ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: trace_id {
    type: string
    sql: ${TABLE}.trace_id ;;
  }

  dimension_group: updated {
    type: time
    timeframes: [
      raw,
      time,
      hour,
      minute5,
      minute30,
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
    drill_fields: [merchants.id, merchants.name, payment_systems_accounts.id, payment_systems_accounts.name]
  }
}
