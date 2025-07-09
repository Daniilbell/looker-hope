view: sql_runner_query {
  derived_table: {
    sql: select
      CONVERT(
                CAST(
                  JSON_UNQUOTE(
                    JSON_EXTRACT(
                      SUBSTRING_INDEX(
                        JSON_UNQUOTE(
                          JSON_EXTRACT(
                            CONVERT(ooe.data USING utf8mb4), '$.response_body')
                          ),
                          '\r\n\r\n', -1),
                          '$.paymentTerms.account')
                  ) AS BINARY
                ) USING utf8mb4
              ) as receiver_account_name,
              ooo.merchant_payment_id, ooe.operation_id, ooo.payment_method, ooo.payment_systems_account_id, ooo.created_at, ooo.status
      from operational_operations_events as ooe
      left join operational_operations as ooo on ooe.operation_id = ooo.operation_id
      where ooe.event_type = 'receiving details' and ooe.source = 'ps-cubepayments' and ooo.created_at BETWEEN '2025-07-08 00:00' AND '2025-07-09 15:18' and ooo.status='success'
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: receiver_account_name {
    type: string
    sql: ${TABLE}.receiver_account_name ;;
  }

  dimension: merchant_payment_id {
    type: string
    sql: ${TABLE}.merchant_payment_id ;;
  }

  dimension: operation_id {
    type: number
    sql: ${TABLE}.operation_id ;;
  }

  dimension: payment_method {
    type: string
    sql: ${TABLE}.payment_method ;;
  }

  dimension: payment_systems_account_id {
    type: number
    sql: ${TABLE}.payment_systems_account_id ;;
  }

  dimension_group: created_at {
    type: time
    sql: ${TABLE}.created_at ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  set: detail {
    fields: [
      receiver_account_name,
      merchant_payment_id,
      operation_id,
      payment_method,
      payment_systems_account_id,
      created_at_time,
      status
    ]
  }
}
