import psycopg2
import pandas as pd
import numpy as np

conn = psycopg2.connect(
    host="codd01.research.northwestern.edu",
    database="postgres",
    user="cpdbstudent",
    password="DataSci4AI")


cursor = conn.cursor()
trr_query = "select * from trr_trr_refresh"
actionresponse_query = "select * from trr_actionresponse_refresh"
#trrstatus_query = "select * from trr_trrstatus_refresh"
#weapondischarge_query = "select * from trr_weapondischarge_refresh"
#charge_query = "select * from trr_charge_refresh"
#subjectweapon_query = "select * from trr_subjectweapon_refresh"

cursor.execute(trr_query)
trr_trr = cursor.fetchall()
print("trr dim is " + str(len(trr_trr))) # 17465

cursor.execute(actionresponse_query)
trr_actionresponse = cursor.fetchall()
print("actionresponse dim is " + str(len(trr_actionresponse))) # 112995
'''
cursor.execute(trrstatus_query)
trr_trrstatus = cursor.fetchall()
print("trrstatus dim is " + str(len(trr_trrstatus))) # 63455

cursor.execute(weapondischarge_query)
trr_weapondischarge = cursor.fetchall()
print("weapondischarge dim is " + str(len(trr_weapondischarge))) # 1308

cursor.execute(charge_query)
trr_charge = cursor.fetchall()
print("charge dim is " + str(len(trr_charge))) #40481

cursor.execute(subjectweapon_query)
trr_subjectweapon = cursor.fetchall()
print("subjectweapon dim is " + str(len(trr_subjectweapon))) # 11731
'''

print(type(trr_trr))
print(len(trr_trr))
print(len(trr_trr[0]))

print(type(trr_actionresponse))
print(len(trr_actionresponse))
print(len(trr_actionresponse[0]))

original_actionrefresh_columns = ['id', 'person', 'resistance_type', 'action', 'other_description', 'member_action',
                                  'force_type', 'action_sub_category', 'action_category', 'resistance_level', 'trr_id',
                                  'created_at', 'updated_at']

df_trr = pd.DataFrame(
    trr_trr,
    columns=['person', 'resistance_type', 'action', 'other_description', 'trr_report_id']
)

print(df_actionresponse.shape)

df_actionresponse = pd.DataFrame(
    trr_actionresponse,
    columns=['person', 'resistance_type', 'action', 'other_description', 'trr_report_id']
)

print(df_actionresponse.shape)
