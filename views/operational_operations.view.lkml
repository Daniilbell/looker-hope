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
            WHEN ${merchant_account_id} = 403301 THEN 'VouWallet.io_p2p_method_sbp-qr'
            WHEN ${merchant_account_id} = 403299 THEN 'VouWallet.io_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403297 THEN 'VouWallet.io_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403295 THEN 'VouWallet.io_p2p_method_sbp-p2p-int'
            WHEN ${merchant_account_id} = 403293 THEN 'Po.trade_p2p_method_sbp-qr'
            WHEN ${merchant_account_id} = 403291 THEN 'Po.trade_untrusted_p2p_method_sbp-qr'
            WHEN ${merchant_account_id} = 403289 THEN 'Cold.bet_untrusted_p2p_method_sbp-p2p-int'
            WHEN ${merchant_account_id} = 403287 THEN 'Cold.bet_p2p_method_sbp-p2p-int'
            WHEN ${merchant_account_id} = 403285 THEN 'Cold.bet_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403283 THEN 'Cold.bet_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403281 THEN 'Cold.bet_untrusted_p2p_method_sbp-qr'
            WHEN ${merchant_account_id} = 403279 THEN 'Cold.bet_p2p_method_sbp-qr'
            WHEN ${merchant_account_id} = 403277 THEN 'Cold.bet_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403275 THEN 'Cold.bet_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403273 THEN 'Winwin.bet_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403271 THEN 'Winwin.bet_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403269 THEN 'Winwin.bet_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403267 THEN 'Fastpari_p2p_method_sbp-p2p-int'
            WHEN ${merchant_account_id} = 403265 THEN 'Fastpari_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403263 THEN 'Fastpari_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403261 THEN 'Fastpari_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403259 THEN 'Fastpari_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403257 THEN 'Fastpari_untrusted_p2p_method_sbp-p2p-int'
            WHEN ${merchant_account_id} = 403255 THEN 'Winwin.bet_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403253 THEN 'olymp.casino_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403251 THEN 'olymp.casino_p2p_method_sbp-p2p-int'
            WHEN ${merchant_account_id} = 403249 THEN 'olymp.casino_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403247 THEN '1XBET LATAM_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403245 THEN '1XBET LATAM_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403243 THEN '1XBET LATAM_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403241 THEN '1XBET LATAM_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403239 THEN 'Melbet_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403237 THEN 'Melbet_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403235 THEN 'Melbet_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403233 THEN 'Melbet_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403231 THEN 'everumcasino.com_p2p_method_sbp-p2p-int'
            WHEN ${merchant_account_id} = 403229 THEN 'everumcasino.com_untrusted_p2p_method_sbp-p2p-int'
            WHEN ${merchant_account_id} = 403227 THEN 'Betcity_p2p_method_sbp-p2p-int'
            WHEN ${merchant_account_id} = 403225 THEN 'Jvspin_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403159 THEN '1xbet_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403161 THEN '1xbet_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403163 THEN '1xbet_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403165 THEN 'everumcasino.com_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403167 THEN 'everumcasino.com_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403169 THEN 'everumcasino.com_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403171 THEN 'everumcasino.com_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403173 THEN 'hiwager_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403175 THEN 'hiwager_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403177 THEN 'hiwager_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403179 THEN 'hiwager_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403181 THEN 'hiwager_p2p_method_sbp-qr'
            WHEN ${merchant_account_id} = 403183 THEN 'hiwager_untrusted_p2p_method_sbp-qr'
            WHEN ${merchant_account_id} = 403185 THEN 'Vibecasino new_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403187 THEN 'Vibecasino new_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403189 THEN 'Vibecasino new_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403191 THEN 'Vibecasino new_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403193 THEN 'goodwico_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403195 THEN 'goodwico new_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403197 THEN 'goodwico new_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403199 THEN '1xslot_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403201 THEN '1xslot_p2p_method_sbp-p2p-int'
            WHEN ${merchant_account_id} = 403203 THEN '1xslot_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403205 THEN '1xslot_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403207 THEN '1xslot_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403209 THEN 'pinco_p2p_method_sbp-p2p-int'
            WHEN ${merchant_account_id} = 403211 THEN 'bons_untrusted_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403213 THEN 'bons_untrusted_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403215 THEN 'bons_p2p_method_sbp-p2p'
            WHEN ${merchant_account_id} = 403217 THEN 'bons_p2p_method_card-p2p'
            WHEN ${merchant_account_id} = 403219 THEN 'bons_untrusted_p2p_method_sbp-p2p-int'
            WHEN ${merchant_account_id} = 403221 THEN 'bons_p2p_method_sbp-p2p-int'
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

  dimension: project_name_cust {
    type: string
    sql: CASE
            WHEN ${merchant_account_id} = 403159 OR ${merchant_account_id} = 403161 OR ${merchant_account_id} = 403163 OR ${merchant_account_id} = 403031 THEN '1xbet'
            WHEN ${merchant_account_id} = 403165 OR ${merchant_account_id} = 403167 OR ${merchant_account_id} = 403169 OR ${merchant_account_id} = 403171 OR ${merchant_account_id} = 403231 OR ${merchant_account_id} = 403229 THEN 'everumcasino.com'
            WHEN ${merchant_account_id} = 403173 OR ${merchant_account_id} = 403175 OR ${merchant_account_id} = 403177 OR ${merchant_account_id} = 403181 OR ${merchant_account_id} = 403183 THEN 'hiwager'
            WHEN ${merchant_account_id} = 403185 OR ${merchant_account_id} = 403187 OR ${merchant_account_id} = 403189 OR ${merchant_account_id} = 403191 THEN 'Vibecasino new'
            WHEN ${merchant_account_id} = 403193 OR ${merchant_account_id} = 403195 OR ${merchant_account_id} = 403197 THEN 'goodwico'
            WHEN ${merchant_account_id} = 403199 OR ${merchant_account_id} = 403201 OR ${merchant_account_id} = 403203 OR ${merchant_account_id} = 403205 OR ${merchant_account_id} = 403207 OR ${merchant_account_id} = 403029 OR ${merchant_account_id} = 403043 THEN '1xslot'
            WHEN ${merchant_account_id} = 403211 OR ${merchant_account_id} = 403213 OR ${merchant_account_id} = 403215 OR ${merchant_account_id} = 403217 OR ${merchant_account_id} = 403219 OR ${merchant_account_id} = 403221 THEN 'bons'
            WHEN ${merchant_account_id} = 403157 OR ${merchant_account_id} = 403155 OR ${merchant_account_id} = 403153 OR ${merchant_account_id} = 403151 THEN 'Vostokcasino'
            WHEN ${merchant_account_id} = 403149 OR ${merchant_account_id} = 403147 OR ${merchant_account_id} = 403145 OR ${merchant_account_id} = 403143 THEN 'metla.bet'
            WHEN ${merchant_account_id} = 403141 OR ${merchant_account_id} = 403139 OR ${merchant_account_id} = 403137 OR ${merchant_account_id} = 403135 THEN 'spinamba TD CL'
            WHEN ${merchant_account_id} = 403133 OR ${merchant_account_id} = 403131 OR ${merchant_account_id} = 403129 OR ${merchant_account_id} = 403127 THEN 'Fontan Direct'
            WHEN ${merchant_account_id} = 403125 OR ${merchant_account_id} = 403123 OR ${merchant_account_id} = 403119 OR ${merchant_account_id} = 403121 THEN 'MNTX drift.casino'
            WHEN ${merchant_account_id} = 403117 OR ${merchant_account_id} = 403115 OR ${merchant_account_id} = 403113 OR ${merchant_account_id} = 403111 THEN 'Olimp.com'
            WHEN ${merchant_account_id} = 403109 OR ${merchant_account_id} = 403107 OR ${merchant_account_id} = 403105 OR ${merchant_account_id} = 403103 THEN 'MNTX frankclubcasino.com'
            WHEN ${merchant_account_id} = 403101 OR ${merchant_account_id} = 403099 OR ${merchant_account_id} = 403097 OR ${merchant_account_id} = 403095 THEN 'MNTX cslotv.com'
            WHEN ${merchant_account_id} = 403093 OR ${merchant_account_id} = 403091 OR ${merchant_account_id} = 403089 OR ${merchant_account_id} = 403087 THEN 'aplay.casino'
            WHEN ${merchant_account_id} = 403085 OR ${merchant_account_id} = 403083 OR ${merchant_account_id} = 403079 OR ${merchant_account_id} = 403081 OR ${merchant_account_id} = 403249 OR ${merchant_account_id} = 403251 OR ${merchant_account_id} = 403253 THEN 'olymp.casino'
            WHEN ${merchant_account_id} = 403073 OR ${merchant_account_id} = 403075 OR ${merchant_account_id} = 403077 OR ${merchant_account_id} = 403071 OR ${merchant_account_id} = 403117 OR ${merchant_account_id} = 403115 OR ${merchant_account_id} = 403113 OR ${merchant_account_id} = 403111 THEN 'olimp.com'
            WHEN ${merchant_account_id} = 403061 OR ${merchant_account_id} = 403059 OR ${merchant_account_id} = 403225 THEN 'Jvspin'
            WHEN ${merchant_account_id} = 403057 OR ${merchant_account_id} = 403055 OR ${merchant_account_id} = 403053 OR ${merchant_account_id} = 403047 THEN 'DB-Bet'
            WHEN ${merchant_account_id} = 403051 OR ${merchant_account_id} = 403041 OR ${merchant_account_id} = 403039 OR ${merchant_account_id} = 403035 THEN 'fortuneclock_FD_CL'
            WHEN ${merchant_account_id} = 403049 OR ${merchant_account_id} = 403045 THEN 'Vavada'
            WHEN ${merchant_account_id} = 403037 OR ${merchant_account_id} = 403033 OR ${merchant_account_id} = 403227 THEN 'Betcity'
            WHEN ${merchant_account_id} = 403027 OR ${merchant_account_id} = 403209 THEN 'pinco'
            WHEN ${merchant_account_id} = 403239 OR ${merchant_account_id} = 403233 OR ${merchant_account_id} = 403237 OR ${merchant_account_id} = 403235 THEN 'Melbet'
            WHEN ${merchant_account_id} = 403241 OR ${merchant_account_id} = 403243 OR ${merchant_account_id} = 403245 OR ${merchant_account_id} = 403247 THEN '1XBET LATAM'
            WHEN ${merchant_account_id} = 403257 OR ${merchant_account_id} = 403259 OR ${merchant_account_id} = 403261 OR ${merchant_account_id} = 403263 OR ${merchant_account_id} = 403265 OR ${merchant_account_id} = 403267 THEN 'Fastpari'
            WHEN ${merchant_account_id} = 403255 OR ${merchant_account_id} = 403269 OR ${merchant_account_id} = 403271 OR ${merchant_account_id} = 403273 THEN 'Winwin'
            WHEN ${merchant_account_id} = 403301 OR ${merchant_account_id} = 403299 OR ${merchant_account_id} = 403297 OR ${merchant_account_id} = 403295 THEN 'VouWallet.io'
            WHEN ${merchant_account_id} = 403293 OR ${merchant_account_id} = 403291 THEN 'Po.trade'
            WHEN ${merchant_account_id} = 403289 OR ${merchant_account_id} = 403287 OR ${merchant_account_id} = 403285 OR ${merchant_account_id} = 403283 OR ${merchant_account_id} = 403281 OR ${merchant_account_id} = 403279 OR ${merchant_account_id} = 403277 OR ${merchant_account_id} = 403275 THEN 'Cold.bet'
        ELSE null
        END ;;
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
            WHEN ${payment_systems_account_id} = 17 THEN 'Tradex SBP INT'
            WHEN ${payment_systems_account_id} = 19 THEN 'Tradex Card P2P PROD'
            WHEN ${payment_systems_account_id} = 21 THEN 'Tradex QR PROD'
            WHEN ${payment_systems_account_id} = 23 THEN 'Tradex CARD INT'
            WHEN ${payment_systems_account_id} = 25 THEN 'Cubepayments QR'
            WHEN ${payment_systems_account_id} = 27 THEN 'Cubepayments QR Test Remove'
            WHEN ${payment_systems_account_id} = 29 THEN 'Cubepayments SBP INT'
            WHEN ${payment_systems_account_id} = 31 THEN 'Tradex SBP INT (TEST)'
            WHEN ${payment_systems_account_id} = 33 THEN 'Tradex Untrusted SBP'
            WHEN ${payment_systems_account_id} = 35 THEN 'Tradex Untrusted SBP INT'
            WHEN ${payment_systems_account_id} = 37 THEN 'Cubepayments Untrusted SBP INT  '
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

  dimension: payment_system_result_code {
    type: string
    sql: CONVERT(
          CAST(
            JSON_UNQUOTE(
              JSON_EXTRACT(CONVERT(operational_operations.data USING utf8mb4), '$.Attrs.ps_result_code')
            ) AS BINARY
          ) USING utf8mb4
        );;
  }

  dimension: payment_system_result_message {
    type: string
    sql: CONVERT(
          CAST(
            JSON_UNQUOTE(
              JSON_EXTRACT(CONVERT(operational_operations.data USING utf8mb4), '$.Attrs.ps_result_message')
            ) AS BINARY
          ) USING utf8mb4
        );;
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
