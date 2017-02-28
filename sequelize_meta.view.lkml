view: sequelize_meta {
  sql_table_name: matter_staging.SequelizeMeta ;;

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}
