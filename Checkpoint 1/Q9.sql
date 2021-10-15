-- Lawsuits, Settlements, Payments, Legal Fees in Misconduct Cases based on the police districts
select
       unit_description, count(distinct (ls_off.llo_officer_id)) as No_of_Officers_Involved_In_Lawsuits,
       count(distinct(lsls_id)) as No_of_Lawsuits,
       sum(total_settlement) as Total_Settlements,
       sum(total_payments) as Total_Payments,
       sum(total_legal_fees) as Total_Legal_Fees
from (
    select *, lsls.id as lsls_id, llo.id as llo_id, llo.officer_id as llo_officer_id
    from
         lawsuit_lawsuit as lsls
             join lawsuit_lawsuit_officers llo
                 on lsls.id = llo.lawsuit_id) as ls_off
    join (
        select *, dof.id as dof_id, dof.last_unit_id as off_unit_id
        from data_officer as dof join (
            select
                   *, da.id as da_id, dpb.id as dpb_id
            from
                 data_policebeat as dpb
                     join data_area da
                         on dpb.area_id = da.id) as area_beat
            on dof.last_unit_id = area_beat.unit_id) as off_unit_race
        on off_unit_race.dof_id = ls_off.llo_officer_id
where off_unit_race.unit_description LIKE '%DISTRICT - %'
  and ls_off.misconducts != '{Not misconduct}'
group by unit_description;