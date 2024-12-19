# Sales Dashboard Analysis

This project involves the development of an interactive sales dashboard to visualize and analyze sales data effectively. The dashboard provides insights into sales trends, top-selling products, regional sales performance, and customer behavior.

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Installation](#installation)
- [Usage](#usage)
- [Data](#data)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

The Sales Dashboard Analysis project aims to provide a user-friendly interface for exploring sales data. By utilizing interactive visualizations, users can gain valuable insights into various aspects of sales performance, aiding in data-driven decision-making.

## Features

- **Interactive Sales Trends Visualization**: Analyze sales over time with dynamic line charts.
- **Top-Selling Products Identification**: Discover the best-performing products through bar charts.
- **Regional Sales Performance**: Evaluate sales distribution across different regions.
- **Customer Insights**: Understand customer purchasing behaviors with pie charts.
- **Date Range and Country Filters**: Customize views to specific time periods and regions.

## Installation

To set up the project locally, follow these steps:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/TeddyM1975/sales-dashboard-analysis.git
   ```
2. **Navigate to the project directory**:
   ```bash
   cd sales-dashboard-analysis
   ```
3. **Create and activate a virtual environment** (optional but recommended):
   ```bash
   python -m venv env
   source env/bin/activate  # On Windows: env\Scripts\activate
   ```
4. **Install the required dependencies**:
   ```bash
   pip install -r requirements.txt
   ```

## Usage

To run the dashboard application:

1. **Ensure you're in the project directory**.
2. **Execute the Streamlit application**:
   ```bash
   streamlit run dashboard_app.py
   ```
3. **Access the dashboard**:
   Open your web browser and navigate to `http://localhost:8501` to interact with the dashboard.

## Data

The dataset used in this project is located in the `data` directory and has undergone preprocessing to ensure accuracy and consistency. For detailed information on data cleaning and exploratory data analysis, refer to the following notebooks:

- **Data Cleaning**: `data_cleaning.ipynb`
- **Exploratory Data Analysis (EDA)**: `sales_dashboard_eda.ipynb`

## Contributing

Contributions are welcome! To contribute:

1. **Fork the repository**.
2. **Create a new branch**:
   ```bash
   git checkout -b feature/YourFeatureName
   ```
3. **Commit your changes**:
   ```bash
   git commit -m 'Add some feature'
   ```
4. **Push to the branch**:
   ```bash
   git push origin feature/YourFeatureName
   ```
5. **Open a pull request**.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
