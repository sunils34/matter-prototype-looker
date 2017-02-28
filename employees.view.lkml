view: employees {
  sql_table_name: matter_staging.employees ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    type: string
    sql: ${TABLE}.age ;;
  }

  dimension: age_range {
    type: string
    sql: ${TABLE}.ageRange ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.createdAt ;;
  }

  dimension: department {
    type: string
    sql: ${TABLE}.department ;;
  }

  dimension: eeo_ethnic_code {
    type: string
    sql: ${TABLE}.eeoEthnicCode ;;
  }

  dimension: eeo_ethnic_description {
    type: string
    sql: ${TABLE}.eeoEthnicDescription ;;
  }

  dimension: employee_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.employeeId ;;
  }

  dimension: flsa_code {
    type: string
    sql: ${TABLE}.flsaCode ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension_group: hire {
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
    sql: ${TABLE}.hireDate ;;
  }

  dimension: job_title {
    type: string
    sql: ${TABLE}.jobTitle ;;
  }

  dimension: location {
    type: string
    sql: ${TABLE}.location ;;
  }

  dimension: org_id {
    type: string
    sql: ${TABLE}.orgId ;;
  }

  dimension: pay_grade_code {
    type: string
    sql: ${TABLE}.payGradeCode ;;
  }

  dimension: position_status {
    type: string
    sql: ${TABLE}.positionStatus ;;
  }

  dimension_group: updated {
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
    sql: ${TABLE}.updatedAt ;;
  }

  dimension: worker_category {
    type: string
    sql: ${TABLE}.workerCategory ;;
  }

  measure: count {
    type: count
    drill_fields: [id, employees.id, employees.count]
  }
}
