view: employee_event_date_measures {

  derived_table: {
    sql:
      SELECT
      DISTINCT FORMAT_TIMESTAMP('%Y-%m-01', TIMESTAMP_TRUNC(CAST(eventDate  AS TIMESTAMP), QUARTER)) as quarter
      FROM employeeEvents
      ;;
  }

  dimension_group: date {
    timeframes: [date, quarter]
    type: time
    datatype: date
    sql: ${TABLE}.quarter ;;
  }

  dimension: quarter_from_hire {
    type: number
    sql: DATE_DIFF( ${date_date}, ${employee_lifetime_details.hire_date_date}, QUARTER) ;;
  }

  dimension: has_been_promoted_this_quarter {
    type: yesno
    sql: ${employee_lifetime_details.first_promotion_date_quarter} = ${date_quarter} ;;
  }

  dimension: has_been_promoted {
    type: yesno
    sql: ${employee_lifetime_details.first_promotion_date_date} <= ${date_date} ;;
  }
}
