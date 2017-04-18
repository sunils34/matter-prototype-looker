view: employee_lifetime_details {
  derived_table: {
    sql: SELECT
      employeeId as employee_id,
      COUNT(*) as event_count,
      (select eventDate from employeeEvents e1 where e1.employeeId=e.employeeId AND eventType='HIR') as hire_date,
      (select ethnicity from employeeEvents e1 where e1.employeeId=e.employeeId AND eventType='HIR') as ethnicity,
      (select gender from employeeEvents e1 where e1.employeeId=e.employeeId AND eventType='HIR') as gender,
      (select department from employeeEvents e1 where e1.employeeId=e.employeeId AND eventType='HIR') as department,
      (select eventDate from employeeEvents e2 where e2.employeeId=e.employeeId AND eventType IN ('TER', 'RET')) as termination_date
      FROM employeeEvents e
      GROUP BY employeeId
       ;;
   }

  dimension: employee_id {
    description: "Employee ID"
    type: string
    sql: ${TABLE}.employee_id ;;
  }

  dimension: event_count {
    description: "Number of Employee Events"
    type: number
    sql: ${TABLE}.event_count ;;
  }

  dimension: gender {
    description: "Gender"
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: ethnicity {
    description: "Ethnicity"
    type: string
    sql: ${TABLE}.ethnicity ;;
  }

  dimension: hire_date {
   description: "Date of Hire"
    type: date
    sql: ${TABLE}.hire_date ;;
  }

  dimension: termination_date {
    description: "Termination Date"
    type: date
    sql: ${TABLE}.termination_date ;;
  }

  dimension: department {
    description: "Department"
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: tenure_months {
    description: "Number of months available"
    type: number
    sql: TIMESTAMPDIFF(month, ${hire_date}, COALESCE(${termination_date}, NOW()))  ;;
  }

  measure: employee_count  {
    description: "Number of employees"
    type: count_distinct
    sql: ${employee_id} ;;
  }

  # # You can specify the table name if it's different from the view name:
  # sql_table_name: my_schema_name.tester ;;
  #
  # # Define your dimensions and measures here, like this:
  # dimension: user_id {
  #   description: "Unique ID for each user that has ordered"
  #   type: number
  #   sql: ${TABLE}.user_id ;;
  # }
  #
  # dimension: lifetime_orders {
  #   description: "The total number of orders for each user"
  #   type: number
  #   sql: ${TABLE}.lifetime_orders ;;
  # }
  #
  # dimension_group: most_recent_purchase {
  #   description: "The date when each user last ordered"
  #   type: time
  #   timeframes: [date, week, month, year]
  #   sql: ${TABLE}.most_recent_purchase_at ;;
  # }
  #
  # measure: total_lifetime_orders {
  #   description: "Use this for counting lifetime orders across many users"
  #   type: sum
  #   sql: ${lifetime_orders} ;;
  # }
}

# view: employee_lifetime_details {
#   # Or, you could make this view a derived table, like this:
#   derived_table: {
#     sql: SELECT
#         user_id as user_id
#         , COUNT(*) as lifetime_orders
#         , MAX(orders.created_at) as most_recent_purchase_at
#       FROM orders
#       GROUP BY user_id
#       ;;
#   }
#
#   # Define your dimensions and measures here, like this:
#   dimension: user_id {
#     description: "Unique ID for each user that has ordered"
#     type: number
#     sql: ${TABLE}.user_id ;;
#   }
#
#   dimension: lifetime_orders {
#     description: "The total number of orders for each user"
#     type: number
#     sql: ${TABLE}.lifetime_orders ;;
#   }
#
#   dimension_group: most_recent_purchase {
#     description: "The date when each user last ordered"
#     type: time
#     timeframes: [date, week, month, year]
#     sql: ${TABLE}.most_recent_purchase_at ;;
#   }
#
#   measure: total_lifetime_orders {
#     description: "Use this for counting lifetime orders across many users"
#     type: sum
#     sql: ${lifetime_orders} ;;
#   }
# }
