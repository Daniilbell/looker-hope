# Define the database connection to be used for this model.
connection: "hope"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: hope_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: hope_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Hope"

explore: checkout_hope_payments {
  join: payment_systems_accounts {
    type: left_outer
    sql_on: ${checkout_hope_payments.payment_systems_account_id} = ${payment_systems_accounts.id} ;;
    relationship: many_to_one
  }

  join: payment_systems {
    type: left_outer
    sql_on: ${payment_systems_accounts.payment_system_id} = ${payment_systems.id} ;;
    relationship: many_to_one
  }
}

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: dictionary_errors {}

explore: interfaces_backoffice_casbin_rule {}

explore: interfaces_backoffice_users {}

explore: merchants {}

explore: merchants_accounts {
  join: merchants {
    type: left_outer
    sql_on: ${merchants_accounts.merchant_id} = ${merchants.id} ;;
    relationship: many_to_one
  }
}

explore: merchants_accounts_whitelists {}

explore: merchants_api_hope_events {}

explore: merchants_api_hope_payments {}

explore: merchants_api_hope_tasks_queue {}

explore: merchants_api_providers {}

explore: operational_customer_accounts {}

explore: operational_customers {}

explore: operational_operations {
  join: merchants {
    type: left_outer
    sql_on: ${operational_operations.merchant_id} = ${merchants.id} ;;
    relationship: many_to_one
  }

  join: payment_systems_accounts {
    type: left_outer
    sql_on: ${operational_operations.payment_systems_account_id} = ${payment_systems_accounts.id} ;;
    relationship: many_to_one
  }

  join: payment_systems {
    type: left_outer
    sql_on: ${payment_systems_accounts.payment_system_id} = ${payment_systems.id} ;;
    relationship: many_to_one
  }
}

explore: operational_operations_events {}

explore: operational_operations_tasks_queue {}

explore: operational_payments {
  join: merchants {
    type: left_outer
    sql_on: ${operational_payments.merchant_id} = ${merchants.id} ;;
    relationship: many_to_one
  }

  join: payment_systems_accounts {
    type: left_outer
    sql_on: ${operational_payments.payment_systems_account_id} = ${payment_systems_accounts.id} ;;
    relationship: many_to_one
  }

  join: payment_systems {
    type: left_outer
    sql_on: ${payment_systems_accounts.payment_system_id} = ${payment_systems.id} ;;
    relationship: many_to_one
  }
}

explore: operational_payments_events {}

explore: operational_payments_tasks_queue {}

explore: operational_routes {}

explore: operational_routes_account {}

explore: operational_routes_cascades {}

explore: operational_routes_packs {}

explore: operational_routes_payment_stirred_cascades {}

explore: payment_systems {}

explore: payment_systems_accounts {
  join: payment_systems {
    type: left_outer
    sql_on: ${payment_systems_accounts.payment_system_id} = ${payment_systems.id} ;;
    relationship: many_to_one
  }
}

explore: payment_systems_api_providers {}

explore: ps_bnpay_operations {
  join: payment_systems_accounts {
    type: left_outer
    sql_on: ${ps_bnpay_operations.payment_systems_account_id} = ${payment_systems_accounts.id} ;;
    relationship: many_to_one
  }

  join: payment_systems {
    type: left_outer
    sql_on: ${payment_systems_accounts.payment_system_id} = ${payment_systems.id} ;;
    relationship: many_to_one
  }
}

explore: ps_bnpay_tasks_queue {}

explore: ps_forta_operations {
  join: payment_systems_accounts {
    type: left_outer
    sql_on: ${ps_forta_operations.payment_systems_account_id} = ${payment_systems_accounts.id} ;;
    relationship: many_to_one
  }

  join: payment_systems {
    type: left_outer
    sql_on: ${payment_systems_accounts.payment_system_id} = ${payment_systems.id} ;;
    relationship: many_to_one
  }
}

explore: ps_forta_tasks_queue {}

explore: ps_ironpay_operations {
  join: payment_systems_accounts {
    type: left_outer
    sql_on: ${ps_ironpay_operations.payment_systems_account_id} = ${payment_systems_accounts.id} ;;
    relationship: many_to_one
  }

  join: payment_systems {
    type: left_outer
    sql_on: ${payment_systems_accounts.payment_system_id} = ${payment_systems.id} ;;
    relationship: many_to_one
  }
}

explore: ps_ironpay_tasks_queue {}

explore: ps_payscrow_operations {
  join: payment_systems_accounts {
    type: left_outer
    sql_on: ${ps_payscrow_operations.payment_systems_account_id} = ${payment_systems_accounts.id} ;;
    relationship: many_to_one
  }

  join: payment_systems {
    type: left_outer
    sql_on: ${payment_systems_accounts.payment_system_id} = ${payment_systems.id} ;;
    relationship: many_to_one
  }
}

explore: ps_payscrow_tasks_queue {}

explore: ps_tradex_operations {
  join: payment_systems_accounts {
    type: left_outer
    sql_on: ${ps_tradex_operations.payment_systems_account_id} = ${payment_systems_accounts.id} ;;
    relationship: many_to_one
  }

  join: payment_systems {
    type: left_outer
    sql_on: ${payment_systems_accounts.payment_system_id} = ${payment_systems.id} ;;
    relationship: many_to_one
  }
}

explore: ps_tradex_tasks_queue {}

explore: sessions {}

explore: utility_credentials {}

explore: utility_credentials_schemes {}

explore: utility_customer_session_tasks_queue {}

explore: utility_customer_sessions {
  join: merchants {
    type: left_outer
    sql_on: ${utility_customer_sessions.merchant_id} = ${merchants.id} ;;
    relationship: many_to_one
  }
}

explore: utility_rcs_client_bind_account {}

explore: utility_rcs_client_payments {}

explore: utility_rcs_client_tasks_queue {}

explore: utility_reports {
  join: merchants {
    type: left_outer
    sql_on: ${utility_reports.merchant_id} = ${merchants.id} ;;
    relationship: many_to_one
  }
}

explore: utility_reports_tasks_queue {}
