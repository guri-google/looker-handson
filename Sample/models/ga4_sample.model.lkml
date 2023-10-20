connection: "next_sample"

include: "/Sample/views/*.view.lkml"                # include all views in the views/ folder in this project
# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

# # Select the views that should be a part of this model,
# # and define the joins that connect them together.
#
explore: ga4_events {
  join: customer_matching {
    type: left_outer
    relationship: many_to_one
    sql_on: ${ga4_events.user_pseudo_id} = ${customer_matching.user_pseudo_id} ;;
  }

  join: customer {
    type: left_outer
    relationship: many_to_one
    sql_on: ${customer_matching.customer_id} = ${customer.id} ;;
  }
}
