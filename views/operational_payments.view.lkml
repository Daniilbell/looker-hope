# The name of this view in Looker is "Operational Payments"
view: operational_payments {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: hope.operational_payments ;;
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

  dimension: cascade_id {
    type: number
    sql: ${TABLE}.cascade_id ;;
  }

  dimension: cascade_step {
    type: number
    sql: ${TABLE}.cascade_step ;;
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

  dimension_group: created_utc3 {
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
    sql: COALESCE(TIMESTAMPADD(hour, 3, ${TABLE}.created_at)) ;;
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

  dimension: gate_operation_id {
    type: number
    sql: ${TABLE}.gate_operation_id ;;
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

  dimension: merchant_account_name_cust {
    type: string
    sql: CASE
            WHEN ${merchant_account_id} = 403197 THEN '20_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403195 THEN '19_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403193 THEN '18_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403191 THEN '17_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403189 THEN '16_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403187 THEN '15_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403185 THEN '14_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403183 THEN '13_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403181 THEN '12_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403179 THEN '11_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403177 THEN '10_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403175 THEN '9_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403173 THEN '8_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403171 THEN '7_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403169 THEN '6_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403167 THEN '5_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403165 THEN '4_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403163 THEN '3_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403161 THEN '2_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403159 THEN '1_Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403157 THEN 'Vostokcasino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403155 THEN 'Vostokcasino_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403153 THEN 'Vostokcasino_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403151 THEN 'Vostokcasino_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403149 THEN 'metla.bet_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403147 THEN 'metla.bet_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403145 THEN 'metla.bet_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403143 THEN 'metla.bet_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403141 THEN 'spinamba TD CL_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403139 THEN 'spinamba TD CL_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403137 THEN 'spinamba TD CL_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403135 THEN 'spinamba TD CL_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403133 THEN 'Fontan Direct_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403131 THEN 'Fontan Direct_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403129 THEN 'Fontan Direct_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403127 THEN 'Fontan Direct_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403125 THEN 'MNTX drift.casino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403123 THEN 'MNTX drift.casino_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403121 THEN 'MNTX drift.casino_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403119 THEN 'MNTX drift.casino_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403117 THEN 'Olimp.com FTD_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403115 THEN 'Olimp.com FTD_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403113 THEN 'Olimp.com FTD_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403111 THEN 'Olimp.com FTD_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403109 THEN 'MNTX frankclubcasino.com_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403107 THEN 'MNTX frankclubcasino.com_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403105 THEN 'MNTX frankclubcasino.com_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403103 THEN 'MNTX frankclubcasino.com_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403101 THEN 'MNTX cslotv.com_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403099 THEN 'MNTX cslotv.com_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403097 THEN 'MNTX cslotv.com_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403095 THEN 'MNTX cslotv.com_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403093 THEN 'aplay.casino_1_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403091 THEN 'aplay.casino_1_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403089 THEN 'aplay.casino_1_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403087 THEN 'aplay.casino_1_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403085 THEN 'olymp.casino FTD_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403083 THEN 'olymp.casino FTD_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403081 THEN 'olymp.casino FTD_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403079 THEN 'olymp.casino FTD_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403073 THEN 'olimp.com_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403075 THEN 'olimp.com_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403077 THEN 'olimp.com_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403071 THEN 'olimp.com_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403061 THEN 'Jvspin_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403059 THEN 'Jvspin_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403057 THEN 'DB-Bet_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403055 THEN 'DB-Bet_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403053 THEN 'DB-Bet_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403051 THEN 'fortuneclock_FD_CL_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403049 THEN 'Vavada_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403047 THEN 'DB-Bet_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403045 THEN 'Vavada_p2p_method_sbp-p2p-transfer'
            WHEN ${merchant_account_id} = 403043 THEN '1xslot_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403041 THEN 'fortuneclock_FD_CL_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403039 THEN 'fortuneclock_FD_CL_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403037 THEN 'Betcity_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403035 THEN 'fortuneclock_FD_CL_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403033 THEN 'Betcity_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403031 THEN '1xbet_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403029 THEN '1xslot_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403027 THEN 'pinco_p2p_method_sbp-p2p'
        ELSE null
        END ;;
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

  dimension: operation_type {
    type: string
    sql: ${TABLE}.operation_type ;;
  }

  dimension: parent_session_payment_id {
    type: number
    sql: ${TABLE}.parent_session_payment_id ;;
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
            WHEN ${payment_systems_account_id} = 23 THEN 'Tradex CARD INT'
            WHEN ${payment_systems_account_id} = 25 THEN 'Cubepayments QR'
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

  dimension_group: updated_utc3 {
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
    sql: COALESCE(TIMESTAMPADD(hour, 3, ${TABLE}.updated_at)) ;;
  }

  measure: count {
    type: count
    drill_fields: [merchants.id, merchants.name, payment_systems_accounts.id, payment_systems_accounts.name]
  }
}
