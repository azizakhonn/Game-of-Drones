--Internal Allegations based on the police districts
select
       unit_description as District_Number_Name,
       count(distinct(allegation_id)) No_of_Allegations
from data_allegation dal
    join (select
                 *
    from data_officerallegation as doa
        join (select *, dof.id as dof_id
        from data_officer as dof join (
            select
                   *, da.id as da_id, dpb.id as dpb_id, area_id as da_area_id
            from
                 data_policebeat as dpb
                     join data_area da
                         on dpb.area_id = da.id) as area_beat
            on dof.last_unit_id = area_beat.unit_id
        where unit_description LIKE '%DISTRICT - %'
        order by da_area_id) as officer_area_beat
            on officer_area_beat.dof_id = doa.officer_id) as offralleg_off_area_beat
on offralleg_off_area_beat.allegation_id = dal.crid
where is_officer_complaint = 'true'
group by unit_description;


--External Allegations based on the police districts
select
       unit_description as District_Number_Name,
       count(distinct(allegation_id)) No_of_Allegations
from data_allegation dal
    join (select
                 *
    from data_officerallegation as doa
        join (select *, dof.id as dof_id
        from data_officer as dof join (
            select
                   *, da.id as da_id, dpb.id as dpb_id, area_id as da_area_id
            from
                 data_policebeat as dpb
                     join data_area da
                         on dpb.area_id = da.id) as area_beat
            on dof.last_unit_id = area_beat.unit_id
        where unit_description LIKE '%DISTRICT - %'
        order by da_area_id) as officer_area_beat
            on officer_area_beat.dof_id = doa.officer_id) as offralleg_off_area_beat
on offralleg_off_area_beat.allegation_id = dal.crid
where is_officer_complaint = 'false'
group by unit_description;