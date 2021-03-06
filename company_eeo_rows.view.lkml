view: company_eeo {
  sql_table_name: matter_staging.companyEeoRows ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: company_name {
    type: string
    sql: ${TABLE}.companyName ;;
  }

  dimension: company_name_year {
    description: "Provide the company name and year as a dimension"
    type: string
    sql: CONCAT(${year}, ' ', ${TABLE}.companyName) ;;
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

  dimension: ethnicity {
    type: string
    sql: ${TABLE}.ethnicity ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: report_link {
    type: string
    sql: ${TABLE}.reportLink ;;
  }

  dimension: total {
    type: number
    sql: ${TABLE}.total ;;
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

  dimension: year {
    type: string
    sql: ${TABLE}.year ;;
  }

  measure: row_count {
    type: count
    drill_fields: [id, company_name]
  }

  measure:  employee_total {
    type: sum
    sql: ${total};;
    drill_fields: [id, company_name]
  }
}
