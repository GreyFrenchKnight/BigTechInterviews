with mountains_ordered_by_country as (
	SELECT ROW_NUMBER() OVER (
			PARTITION BY country ORDER BY country ASC, height DESC
    	) AS rownumber,
  		name, height, country
	FROM mountains
)
	SELECT country, name FROM mountains_ordered_by_country
	WHERE rownumber = 3
	ORDER BY country ASC, height DESC;