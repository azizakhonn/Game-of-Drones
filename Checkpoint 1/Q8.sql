--Weapons Discharges related disparity based on the police districts
select
       unit_description as District_Number_Name,
       count(officer_injured) as No_of_injured_Officers,
       count(subject_injured) as No_of_injured_Civilians,
       sum(total_number_of_shots) as Total_Shots_Fired,
       sum(number_of_officers_using_firearm) as No_of_Armed_Officers,
       sum(number_of_weapons_discharged) as No_of_Weapons_Discharged
from (
         select area_id,
                unit_description,
                officer_injured,
                subject_injured,
                total_number_of_shots,
                number_of_officers_using_firearm,
                number_of_weapons_discharged
         from data_area da
                  join (
             select *, area_id as view1_area_id
             from trr_trr as trr
                      join data_policebeat as dpu
                           on trr.officer_unit_id = dpu.unit_id) as view1
                       on view1.view1_area_id = da.id
         where unit_description LIKE '%DISTRICT - %'
         group by area_id, unit_description, officer_injured, subject_injured, total_number_of_shots,
                  number_of_officers_using_firearm, number_of_weapons_discharged
     ) as view2
group by unit_description;
