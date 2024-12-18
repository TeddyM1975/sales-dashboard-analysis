import pandas as pd
import streamlit as st
import plotly.express as px


data = pd.read_csv('data\cleaned_dashboard_sales_data.csv')



st.title("Sales Dashboard")
st.sidebar.header("Filters")

# Sidebar filters
date_range = st.sidebar.date_input("Select Date Range", [])
region = st.sidebar.selectbox("Select Country", data['Country'].unique())


filtered_data = data[(data['InvoiceDate'] >= '2010-12-01') & (data['InvoiceDate'] <= '2011-12-09')]
fig = px.line(filtered_data, x='InvoiceDate', y='Sales', title="Sales Trends Over Time")
st.plotly_chart(fig)


top_products = filtered_data.groupby('StockCode')['Sales'].sum().nlargest(10)
fig = px.bar(top_products, x=top_products.index, y='Sales', title="Top-Selling Products")
st.plotly_chart(fig)


region_sales = filtered_data.groupby('Country')['Sales'].sum()
fig = px.bar(region_sales, x=region_sales.index, y='Sales', title="Regional Sales Performance")
st.plotly_chart(fig)


customer_data = filtered_data.groupby('CustomerID')['Sales'].sum()
fig = px.pie(customer_data, values='Sales', names=customer_data.index, title="Customer Insights")
st.plotly_chart(fig)