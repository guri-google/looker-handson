# The name of this view in Looker is "Ga4 Customer"
view: ga4_customer {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `handson.ga4_customer` ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Age" in Explore.

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: click {
    type: number
    sql: ${TABLE}.click ;;
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: device_category {
    type: string
    sql: ${TABLE}.device_category ;;
  }

  dimension: device_mobile_brand_name {
    type: string
    sql: ${TABLE}.device_mobile_brand_name ;;
  }

  dimension: device_mobile_model_name {
    type: string
    sql: ${TABLE}.device_mobile_model_name ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: event {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.event_date ;;
  }

  dimension: event_name {
    type: string
    sql: ${TABLE}.event_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: new_user {
    type: number
    sql: ${TABLE}.new_user ;;
  }

  dimension: page_view {
    type: number
    sql: ${TABLE}.page_view ;;
  }

  dimension: purchase {
    type: number
    sql: ${TABLE}.purchase ;;
  }

  dimension: session {
    type: number
    sql: ${TABLE}.session ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_session {
    type: sum
    sql: ${session} ;;  }
  measure: average_session {
    type: average
    sql: ${session} ;;  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source_medium {
    type: string
    sql: ${TABLE}.traffic_source_medium ;;
  }

  dimension: traffic_source_source {
    type: string
    sql: ${TABLE}.traffic_source_source ;;
  }

  dimension: user_pseudo_id {
    type: string
    sql: ${TABLE}.user_pseudo_id ;;
  }
  measure: count {
    type: count
    drill_fields: [device_mobile_model_name, name, event_name, device_mobile_brand_name]
  }
}
