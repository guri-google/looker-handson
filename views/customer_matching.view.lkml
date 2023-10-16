# The name of this view in Looker is "Customer Matching"
view: customer_matching {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `handson.customer_matching` ;;
  drill_fields: [user_pseudo_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: user_pseudo_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Customer ID" in Explore.

  dimension: customer_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.customer_id ;;
  }
  measure: count {
    type: count
    drill_fields: [user_pseudo_id, customer.last_name, customer.id, customer.first_name]
  }
}
