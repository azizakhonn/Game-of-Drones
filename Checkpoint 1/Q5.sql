--Weapons Discharges Disparity based on the police districts
select
       unit_description,
       dof_major_award_count as No_of_Major_Awards,
       count(dof_id) as No_of_Officers,
       sum(dof_allegation_count) as Total_Allegations,
       sum(dof_sustained_count) as Total_Sustained
from (
    select dof.id as dof_id,
           dof.allegation_count as dof_allegation_count,
           area_beat.unit_description,
           dof.sustained_count as dof_sustained_count,
           dof.major_award_count as dof_major_award_count
    from data_officer as dof
        join (
            select
                   *, da.id as da_id, dpb.id as dpb_id, area_id as da_area_id
            from
                 data_policebeat as dpb
                     join data_area da
                         on dpb.area_id = da.id) as area_beat
            on dof.last_unit_id = area_beat.unit_id
        where unit_description LIKE '%DISTRICT - %'
       group by
                dof_id,
                unit_description,
                allegation_count,
                dof_sustained_count,
                dof_major_award_count) as officer_unitdesc_award
group by unit_description, dof_major_award_count
