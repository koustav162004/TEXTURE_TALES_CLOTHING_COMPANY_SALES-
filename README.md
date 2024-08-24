# Texture Tales Clothing Company Sales Analysis

## Overview

This project involves analyzing sales data for Texture Tales Clothing Company to provide actionable insights and support the merchandising team. The analysis covers various aspects of sales, discounts, and transaction data to help optimize sales strategies and decision-making.

## Schema Used

The analysis is based on the following database schema:

### `product_details`

- `product_id`: Unique identifier for each product
- `price`: Price of the product
- `product_name`: Name of the product
- `category_id`: Identifier for the product category
- `segment_id`: Identifier for the product segment
- `style_id`: Identifier for the product style
- `category_name`: Name of the product category
- `segment_name`: Name of the product segment
- `style_name`: Name of the product style

### `sales`

- `prod_id`: Product identifier
- `qty`: Quantity sold
- `price`: Price per unit
- `discount`: Discount applied
- `member`: Membership status (e.g., Member or Non-member)
- `txn_id`: Transaction identifier
- `start_txn_time`: Start time of the transaction

### `product_hierarchy`

- `id`: Unique identifier for the product hierarchy record
- `product_id`: Product identifier
- `price`: Price of the product at the time
- `start_date`: Start date for the price record
- `end_date`: End date for the price record

### `product_prices`

- `id`: Unique identifier for the price record
- `product_id`: Product identifier
- `price`: Price of the product

## Case Study Questions

The following questions are addressed in this analysis:

1. What was the total quantity sold for all products?
2. What is the total generated revenue for all products before discounts?
3. What was the total discount amount for all products?
4. How many unique transactions were there?
5. What are the average unique products purchased in each transaction?
6. What is the average discount value per transaction?
7. What is the average revenue for member transactions and non-member transactions?
8. What are the top 3 products by total revenue before discount?
9. What are the total quantity, revenue, and discount for each segment?
10. What is the top-selling product for each segment?
11. What are the total quantity, revenue, and discount for each category?
12. What is the top-selling product for each category?
