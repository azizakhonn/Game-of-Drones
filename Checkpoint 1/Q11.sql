-- Search Warrants and Potential Allegation Searches based on the police districts
select
       officer_area_beat.unit_description as District_Number_Name,
       count(distinct(dsw.warrant_id)) as No_of_Warrents_Issued,
       count(distinct(dsw.potential_crid)) as No_of_Searches_with_Potential_Misallegations
from
     data_searchwarrant as dsw
         join (select *
         from data_officer as dof join (
             select
                    *
             from
                  data_policebeat as dpb
                      join data_area da
                          on dpb.area_id = da.id
             ) as area_beat
             on dof.last_unit_id = area_beat.unit_id
             ) as officer_area_beat
             on officer_area_beat.last_unit_id = dsw.policeunit_id
group by officer_area_beat.unit_description;