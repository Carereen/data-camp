# import data
import pandas as pd
df = pd.read_csv("store.csv")

# preview top 5 rows
df.head()

# shape of dataframe
df.shape

# see data frame information using .info()
df.info()

# TODO - count nan in postal code column
result = df["Postal Code"].isna().sum()
print(f"nan in Postal Code column:", result, "row")

# TODO - filter rows with missing values
df.isna().sum()

# TODO - Explore this dataset on your owns, ask your own questions
# top 5 sales in United state
df.groupby("State")["Sales"].sum() \
    .sort_values(ascending=False) \
    .head(5)

# TODO 01 - how many columns, rows in this dataset
df.shape
print(f"row: 9994, column: 22")

# TODO 02 - is there any missing values?, if there is, which colunm? how many nan values?
missing_values = df.isna().sum() 
print(f"missing values:", missing_values["Postal Code"], "rows")

# TODO 03 - your friend ask for `California` data, filter it and export csv for him
# select  
result_ca = df.query("State == 'California'")
result_ca.to_csv("result_ca.csv")
result_ca

# TODO 04 - your friend ask for all order data in `California` and `Texas` in 2017 (look at Order Date), send him csv file
# change Order Date column type from srt to date 
df["Order Date"]= pd.to_datetime(df['Order Date'])

# select data in California and Texas
df_ca_ta_2017 = df[df["Order Date"].between('2017-01-01', '2017-12-31', inclusive="both")].query("State == 'California' | State == 'Texas'").sort_values("Order Date")

# write file .csv
df_ca_ta_2017.to_csv("CA_and_Ta.csv")
df_ca_ta_2017

# TODO 05 - how much total sales, average sales, and standard deviation of sales your company make in 2017
# select day in 2017
df_2017 = df[df["Order Date"].between('2017-01-01', '2017-12-31', inclusive="both")]

# find total sales, average,
agg_2017 = df_2017["Sales"].agg(["sum","mean","std"])

print(f"total sales:",agg_2017["sum"])
print(f"average sales:", agg_2017["mean"])
print(f"standard deviation of sales:", agg_2017["std"])

# TODO 06 - which Segment has the highest profit in 2018
# select day in 2018
df_2018 = df[df["Order Date"].between('2018-01-01', '2018-12-31', inclusive="both")]

# the most profit of segment in 2018
segment_2018 = df_2018.groupby("Segment")["Profit"].sum().head(1)
print(f"The most profit of segment in 2018:", segment_2018)

# TODO 07 - which top 5 States have the least total sales between 15 April 2019 - 31 December 2019
# select between 15 April 2019 - 31 December 2019
df_apr_19 = df[df["Order Date"].between('2019-04-15', '2019-12-31', inclusive="both")]

# sort state group and sum sales column
least_sales_19 = df_apr_19.groupby("State")["Sales"].sum().sort_values().head(5)
print(f"Top 5 states have the least tatol sales:", least_sales_19)

# TODO 08 - what is the proportion of total sales (%) in West + Central in 2019 e.g. 25% +
# select day in 2019
df_2019 = df[df["Order Date"].between('2019-01-01', '2019-12-31', inclusive="both")]

# select west and central region in 2019
wes_cen_2019 = df_2019.query("Region == ['West','Central']")

# sum of sale in west, central region in 2019
sales_wes_cen_2019 = wes_cen_2019["Sales"].sum()
sales_2019 = df_2019["Sales"].sum()

# find proportion 
proportion = sales_wes_cen_2019/sales_2019 * 100

# TODO 09 - find top 10 popular products in terms of number of orders vs. total sales during 2019-2020
# select year in 2019-2020
df_19_20 = df[df["Order Date"].between('2019-01-01', '2020-12-31', inclusive="both")]

# sort top 10 number of orders
orders_19_20 = df_19_20.groupby("Product Name")["Quantity"].sum().sort_values(ascending=False).head(10) 
print(f"top 10 number of orders:",orders_19_20)

# sort top 10 number of sales
sales_19_20 = df_19_20.groupby("Product Name")["Sales"].sum().sort_values(ascending=False).head(10)
print(f"top 10 number of sales", sales_19_20)

# TODO 10 - plot at least 2 plots, any plot you think interesting :)
# chart 1
# select data in 2020
df_2020 = df[df["Order Date"].between('2020-01-01', '2020-12-31', inclusive="both")]

# top 5 state of profit in 2020
df_2020.groupby("State")["Profit"].sum().sort_values(ascending=False).head(5) \
    .plot(kind="bar",color=["#388bd9", "#64a3e2", "#8cbaeb", "#b2d1f2", "#d8e8f9"]);

# chart 2
# sales in 2020
df_2020[["Order Date", "Sales"]].sort_values("Order Date").plot(x="Order Date", y="Sales", kind="line", color="#36b33b");

# TODO Bonus - use np.where() to create new column in dataframe to help you answer your own questions
import numpy as np

# sort city in California
df_cali = df.query("State == 'California'")[["State", "City", "Profit"]].groupby("City").sum("Profit")

# find profit >= 100 in California
df_cali["Profit 2"] = np.where(df_cali["Profit"] >= 100, True, False)
df_cali

