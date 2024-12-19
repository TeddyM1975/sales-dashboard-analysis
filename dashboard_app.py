import pandas as pd
import streamlit as st
import plotly.express as px

# Load and preprocess data
data = pd.read_csv('data/cleaned_dashboard_sales_data.csv')
data['InvoiceDate'] = pd.to_datetime(data['InvoiceDate'])  # Ensure correct datetime format

# Title
st.title("Sales Dashboard")
st.sidebar.header("Filters")

# Sidebar filters
date_range = st.sidebar.date_input(
    "Select Date Range",
    [data['InvoiceDate'].min().date(), data['InvoiceDate'].max().date()],
    min_value=data['InvoiceDate'].min().date(),
    max_value=data['InvoiceDate'].max().date(),
)

region = st.sidebar.selectbox("Select Country", ["All"] + data['Country'].unique().tolist())

# Filter data based on user input
filtered_data = data[
    (data['InvoiceDate'] >= pd.Timestamp(date_range[0])) &
    (data['InvoiceDate'] <= pd.Timestamp(date_range[1]))
]

if region != "All":
    filtered_data = filtered_data[filtered_data['Country'] == region]

# Sales trends over time
fig = px.line(filtered_data, x='InvoiceDate', y='Sales', title="Sales Trends Over Time")
st.plotly_chart(fig)

# Top-selling products
top_products = filtered_data.groupby('Description')['Sales'].sum().nlargest(10).reset_index()
fig = px.bar(top_products, x='Description', y='Sales', title="Top-Selling Products")
st.plotly_chart(fig)

# Regional sales performance (Top 10)
region_sales = filtered_data.groupby('Country')['Sales'].sum().nlargest(10).reset_index()
fig = px.bar(region_sales, x='Country', y='Sales', title="Regional Sales Performance (Top 10)")
st.plotly_chart(fig)

# Customer insights (Top 10)
customer_data = filtered_data.groupby('CustomerID')['Sales'].sum().nlargest(10).reset_index()
fig = px.pie(customer_data, values='Sales', names='CustomerID', title="Top 10 Customers by Sales")
st.plotly_chart(fig)
