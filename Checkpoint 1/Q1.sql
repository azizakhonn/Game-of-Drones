-- Racial Makeup of the Police Officers based on the police districts
select
       unit_description as District_Number_Name, race, count(distinct(dof_id)) as No_of_Officers
from
     (select *, dof.id as dof_id
     from data_officer as dof join (
         select
                *, da.id as da_id, dpb.id as dpb_id
         from
              data_policebeat as dpb
                  join data_area da
                      on dpb.area_id = da.id) as area_beat
         on dof.last_unit_id = area_beat.unit_id) as officer_area_beat
where unit_description LIKE '%DISTRICT - %'
  and active = 'Yes'
group by unit_description, race;


-- Racial Makeup of the Population based on the police districts
select
       name as District_Number, description as District_Name, race, sum(count) as Population
from
     data_racepopulation drp
         join data_area da
             on drp.area_id = da.id
where da.area_type = 'police-districts'
group by name, description, race;


