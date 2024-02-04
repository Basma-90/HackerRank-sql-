SELECT ROUND((t.max_x - t.min_x) + (t.max_y - t.min_y), 4)
FROM (SELECT MAX(LAT_N) AS max_x, MIN(LAT_N) as min_x, MAX(LONG_W) as max_y, MIN(LONG_W) as min_y FROM STATION) as t;
