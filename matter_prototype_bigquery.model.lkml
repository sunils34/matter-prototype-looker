connection: "matter-bigquery"

include: "*.view.lkml"         # include all views in this project
include: "*.dashboard.lookml"  # include all dashboards in this project

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
# explore: order_items {
#   join: orders {
#     relationship: many_to_one
#     sql_on: ${orders.id} = ${order_items.order_id} ;;
#   }
#
#   join: users {
#     relationship: many_to_one
#     sql_on: ${users.id} = ${orders.user_id} ;;
#   }
# }

explore:  employee_event_date_measures {
  label: "Employee Lifetime Details"
  join: employee_lifetime_details {
    relationship: many_to_many
    sql_on: 1=1 ;;
    sql_where: (${employee_lifetime_details.hire_date_date} <= ${employee_event_date_measures.date_date}
      AND ${employee_event_date_measures.date_date} < IFNULL(${employee_lifetime_details.termination_date_date}, CURRENT_DATE()))
      ;;
  }
}

explore:  employee_lifetime_details {
  label: "Employee Lifetime Details (Raw)"
}
