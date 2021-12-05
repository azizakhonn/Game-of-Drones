
# Game of Drones

## Theme: Community Based Policing
## Checkpoint 4

The theme of the project is Community Based Policing. We are
 trying to analyze how policing behavior and characteristics change in different areas. In our queries we have done this analysis at a district level. We have analyzed specific aspects of the district police forces. The questions we have narrowed down to are:

1. Reasons for award disparities in two of the districts with highest awards count.
    
2.  Reasons for disparity in the process of disciplining of officers who have misconduct allegations against them


## Graph Analytics using Graphframes 

The graphframes software was used for the graph analytics in python. The graphs we created were:

 - Relationship between award requesters and awardees, the relationship being the number of awards requested. So each vertex is an award requester with the number of awards he/she requested and the edges contain awardees as the src and requesters as the destination with the number of awards requested by that requester for that specific awardee.
 - Relationship between misconduct investigators and officers, the relationship being the allegation count. Each vertex has officer id, race and allegation count and eachedge has investigator id as src, officer id as destination and relationship as number of allegations
 
 
 ## How to run the code
 - The whole analysis is done in python so any python IDE should work.  
 - There are two notebooks for two questions being answered: 
        -   Awards question -GameOfDrones_award_requestor_graph_CP4.ipynb
        - Investigators question - GameOfDrones_investigator_graph_CP4.ipynb
 - The packages that are required are:
          
      -    [ ] pyspark
      -  [ ] graphframes
      -  [ ] findspark
      -  [ ] pandas
      -  [ ] psycopg2
      - [ ] numpy
      - [ ] os
- The link to the driver that is needed to run graphx : https://repos.spark-packages.org/graphframes/graphframes/0.8.2-spark3.2-s_2.12/graphframes-0.8.2-spark3.2-s_2.12.jar
