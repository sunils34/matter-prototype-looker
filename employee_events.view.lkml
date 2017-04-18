view: employee_events {
  sql_table_name: matter_staging.employeeEvents ;;

  dimension_group: birthdate {
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
    sql: ${TABLE}.birthdate ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: eeo_ethnicity {
    type: string
    sql: ${TABLE}.eeoEthnicity ;;
  }

  dimension: employee_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.employeeId ;;
  }

  dimension: ethnicity {
    type: string
    sql: ${TABLE}.ethnicity ;;
  }

  dimension_group: event {
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
    sql: ${TABLE}.eventDate ;;
  }

  dimension: event_id {
    type: string
    sql: ${TABLE}.eventId ;;
  }

  dimension: event_sub_type {
    type: string
    sql: ${TABLE}.eventSubType ;;
  }

  dimension: event_type {
    type: string
    sql: ${TABLE}.eventType ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: hiring_manager {
    type: string
    sql: ${TABLE}.hiringManager ;;
  }

  dimension: job_code {
    type: string
    sql: ${TABLE}.jobCode ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: major_department {
    type: string
    sql: ${TABLE}.majorDepartment ;;
  }

  dimension: pay_grade {
    type: string
    sql: ${TABLE}.payGrade ;;
  }

  measure: count {
    type: count
    drill_fields: [employees.employee_id]
  }
}
