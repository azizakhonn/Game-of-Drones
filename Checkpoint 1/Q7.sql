--Salary Disparity based on the police districts

--Creating a MEDIAN function
CREATE OR REPLACE FUNCTION _final_median(numeric[])
   RETURNS numeric AS
$$
   SELECT AVG(val)
   FROM (
     SELECT val
     FROM unnest($1) val
     ORDER BY 1
     LIMIT  2 - MOD(array_upper($1, 1), 2)
     OFFSET CEIL(array_upper($1, 1) / 2.0) - 1
   ) sub;
$$
LANGUAGE 'sql' IMMUTABLE;

CREATE AGGREGATE median(numeric) (
  SFUNC=array_append,
  STYPE=numeric[],
  FINALFUNC=_final_median,
  INITCOND='{}'
);

--Salary Disparity based on the police districts
select unit_description, avg(salary) as avg_salary, count(dof_id) as no_of_off, median(salary) as median_salary
from
(select  dof.id as dof_id, unit_description,dof.current_salary as salary
        from data_officer as dof join (
            select
                   *, da.id as da_id, dpb.id as dpb_id, area_id as da_area_id
            from
                 data_policebeat as dpb
                     join data_area da
                         on dpb.area_id = da.id) as area_beat
            on dof.last_unit_id = area_beat.unit_id
        where unit_description LIKE '%DISTRICT - %' and dof.current_salary is not null
    group by dof.id, unit_description, dof.current_salary) as view1
group by unit_description