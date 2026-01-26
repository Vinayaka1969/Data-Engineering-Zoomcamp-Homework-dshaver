#!/usr/bin/env python
# coding: utf-8

# In[10]:


import pandas as pd

from sqlalchemy import create_engine

engine = create_engine('postgresql://root:root@localhost:5432/ny_taxi')
get_ipython().system('wget https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2025-11.parquet')

df_green = pd.read_parquet('green_tripdata_2025-11.parquet')
df_green.head()
df_green.to_sql(name='green_taxi_tripdata', con=engine, if_exists='replace')


# In[ ]:




