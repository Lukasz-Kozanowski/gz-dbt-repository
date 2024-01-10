{% macro yearmonth(some_date) %}

    extract(year from {{some_date}}) || '-' || extract(month from {{some_date}})

{% endmacro %}