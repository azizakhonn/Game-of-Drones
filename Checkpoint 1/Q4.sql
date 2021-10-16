--Awards Disparity based on the police districts
select
       unit_description as District_Number_Name,
       sum(major_award_count) as No_of_Awards,
       count(dof_id) as No_of_Officers
from (
    select
           dof.id as dof_id,
           dof.major_award_count,
           area_beat.unit_description
    from data_officer as dof join (
        select
               *, da.id as da_id, dpb.id as dpb_id, area_id as da_area_id
        from
             data_policebeat as dpb
                 join data_area da
                     on dpb.area_id = da.id) as area_beat
        on dof.last_unit_id = area_beat.unit_id
    where unit_description LIKE '%DISTRICT - %'
    group by dof_id, unit_description, major_award_count) as officer_unitdesc_award
group by unit_description