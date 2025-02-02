#!/usr/bin/env python
# coding: utf-8

import dash
from dash import dcc, html
from dash.dependencies import Input, Output
import pandas as pd
import plotly.express as px

data = pd.read_csv('https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-DV0101EN-SkillsNetwork/Data%20Files/historical_automobile_sales.csv')
year_list = [i for i in range(1980, 2024)]

app = dash.Dash(__name__)
app.title = "Automobile Sales Statistics Dashboard"

title = html.H1(
    "Automobile Sales Statistics Dashboard",
    style={'textAlign': 'center', 'color': '#503D36', 'fontSize': 24}
)

dropdown_statistics = dcc.Dropdown(
    id='dropdown-statistics',
    options=[
        {'label': 'Yearly Statistics', 'value': 'Yearly Statistics'},
        {'label': 'Recession Period Statistics', 'value': 'Recession Period Statistics'}
    ],
    placeholder='Select a report type',
    value='Select Statistics',
    style={'width': '80%', 'padding': '3px', 'fontSize': '20px', 'textAlignLast': 'center'}
)

dropdown_year = dcc.Dropdown(
    id='select-year',
    options=[{'label': i, 'value': i} for i in year_list],
    placeholder='Select-year',
    value='Select-year',
    style={'width': '80%', 'padding': '3px', 'fontSize': '20px', 'textAlignLast': 'center'}
)

output_div = html.Div(
    [html.Div(id='output-container', className='chart-grid', style={'display': 'flex'})]
)

app.layout = html.Div([
    title,
    html.Br(),
    html.Div([html.Label("Select Report Type:"), dropdown_statistics]),
    html.Br(),
    html.Div([html.Label("Select Year:"), dropdown_year]),
    html.Br(),
    output_div
])

@app.callback(
    Output(component_id='select-year', component_property='disabled'),
    Input(component_id='dropdown-statistics', component_property='value')
)
def update_input_container(selected_statistics):
    if selected_statistics == 'Yearly Statistics':
        return False
    else:
        return True

@app.callback(
    Output(component_id='output-container', component_property='children'),
    [Input(component_id='dropdown-statistics', component_property='value'),
     Input(component_id='select-year', component_property='value')]
)
def update_output_container(selected_statistics, input_year):
    if selected_statistics == 'Recession Period Statistics':
        recession_data = data[data['Recession'] == 1]
        yearly_rec = recession_data.groupby('Year')['Automobile_Sales'].mean().reset_index()
        R_chart1 = dcc.Graph(
            figure=px.line(yearly_rec, x='Year', y='Automobile_Sales', title="Automobile Sales Fluctuation over Recession Period")
        )
        average_sales = recession_data.groupby('Vehicle_Type')['Automobile_Sales'].mean().reset_index()
        R_chart2 = dcc.Graph(
            figure=px.bar(average_sales, x='Vehicle_Type', y='Automobile_Sales', title="Average Vehicles Sold by Vehicle Type")
        )
        exp_rec = recession_data.groupby('Vehicle_Type')['Advertising_Expenditure'].sum().reset_index()
        R_chart3 = dcc.Graph(
            figure=px.pie(exp_rec, values='Advertising_Expenditure', names='Vehicle_Type', title="Advertising Expenditure Share by Vehicle Type")
        )
        unemp_data = recession_data.groupby(['unemployment_rate', 'Vehicle_Type'])['Automobile_Sales'].mean().reset_index()
        R_chart4 = dcc.Graph(
            figure=px.bar(unemp_data, x='unemployment_rate', y='Automobile_Sales', color='Vehicle_Type',
                          labels={'unemployment_rate': 'Unemployment Rate', 'Automobile_Sales': 'Average Automobile Sales'},
                          title="Effect of Unemployment Rate on Vehicle Type and Sales")
        )
        return [
            html.Div(className='chart-item', children=[R_chart1, R_chart2], style={'display': 'flex'}),
            html.Div(className='chart-item', children=[R_chart3, R_chart4], style={'display': 'flex'})
        ]
    elif selected_statistics == 'Yearly Statistics' and input_year != 'Select-year':
        yearly_data = data[data['Year'] == input_year]
        yas = data.groupby('Year')['Automobile_Sales'].mean().reset_index()
        Y_chart1 = dcc.Graph(
            figure=px.line(yas, x='Year', y='Automobile_Sales', title="Yearly Automobile Sales Trend")
        )
        mas = yearly_data.groupby('Month')['Automobile_Sales'].sum().reset_index()
        Y_chart2 = dcc.Graph(
            figure=px.line(mas, x='Month', y='Automobile_Sales', title="Total Monthly Automobile Sales")
        )
        avr_vdata = yearly_data.groupby('Vehicle_Type')['Automobile_Sales'].mean().reset_index()
        Y_chart3 = dcc.Graph(
            figure=px.bar(avr_vdata, x='Vehicle_Type', y='Automobile_Sales', title=f"Average Vehicles Sold by Vehicle Type in {input_year}")
        )
        exp_data = yearly_data.groupby('Vehicle_Type')['Advertising_Expenditure'].sum().reset_index()
        Y_chart4 = dcc.Graph(
            figure=px.pie(exp_data, values='Advertising_Expenditure', names='Vehicle_Type', title="Total Advertisement Expenditure by Vehicle Type")
        )
        return [
            html.Div(className='chart-item', children=[Y_chart1, Y_chart2], style={'display': 'flex'}),
            html.Div(className='chart-item', children=[Y_chart3, Y_chart4], style={'display': 'flex'})
        ]
    else:
        return None

if __name__ == '__main__':
    app.run_server(debug=True)
