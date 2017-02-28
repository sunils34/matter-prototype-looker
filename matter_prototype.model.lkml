connection: "matter-sql"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

explore: employees {}

explore: organizations {}

explore: sequelize_meta {}

explore: sessions {}

explore: user_organizations {
  join: users {
    type: left_outer
    sql_on: ${user_organizations.user_id} = ${users.id} ;;
    relationship: many_to_one
  }

  join: organizations {
    type: left_outer
    sql_on: ${user_organizations.organization_id} = ${organizations.id} ;;
    relationship: many_to_one
  }
}

explore: users {}
