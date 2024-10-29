# Restaurant Management Database

Welcome to the Restaurant Management Database project! This is a structured MS SQL database designed to store, manage, and retrieve data related to restaurant operations. It enables efficient handling of daily operations, enhances customer service, and streamlines financial management.

## Table of Contents

- [Features](#features)
- [Database Schema](#database-schema)
- [Getting Started](#getting-started)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Features

- **Customer Management**: Store and manage customer information, including preferences and contact details.
- **Employee Management**: Keep track of staff details, roles, and work schedules.
- **Menu and Dish Management**: Organize menus, including categories, items, ingredients, prices, and availability.
- **Order Management**: Record and manage customer orders, including order items, quantities, and statuses.
- **Reservation System**: Track table bookings, reservation timings, and customer information.
- **Inventory Management**: Monitor stock levels of ingredients and supplies for meal preparation.
- **Billing and Payments**: Log transactions, including payment methods and totals.
- **Supplier Management**: Store details about ingredient and supply vendors.

## Database Schema

The key tables in the database include:

- **Customers**
  - `CustomerID`: Unique identifier for each customer
  - `Name`: Customer's name
  - `Contact`: Customer's contact information
  - `Preferences`: Customer preferences

- **Employees**
  - `EmployeeID`: Unique identifier for each employee
  - `Name`: Employee's name
  - `Role`: Job title/role
  - `Schedule`: Work schedule

- **Menus and Dishes**
  - `MenuID`: Unique identifier for each menu
  - `DishID`: Unique identifier for each dish
  - `Category`: Category of the dish
  - `Ingredients`: List of ingredients
  - `Price`: Price of the dish
  - `Availability`: Availability status

- **Orders**
  - `OrderID`: Unique identifier for each order
  - `CustomerID`: ID of the customer who placed the order
  - `OrderItems`: List of ordered items
  - `Quantity`: Quantity of each item
  - `Status`: Current status of the order

- **Reservations**
  - `ReservationID`: Unique identifier for each reservation
  - `CustomerID`: ID of the customer making the reservation
  - `TableNumber`: Table number reserved
  - `ReservationTime`: Time of the reservation

- **Inventory**
  - `InventoryID`: Unique identifier for each inventory item
  - `Ingredient`: Name of the ingredient
  - `StockLevel`: Current stock level

- **Billing and Payments**
  - `TransactionID`: Unique identifier for each transaction
  - `OrderID`: ID of the related order
  - `PaymentMethod`: Method of payment
  - `TotalAmount`: Total amount billed

- **Suppliers**
  - `SupplierID`: Unique identifier for each supplier
  - `Name`: Supplier name
  - `ContactInfo`: Supplier contact information

## Getting Started

To get started with this project, follow these steps:

### Prerequisites

- Microsoft SQL Server
- SQL Server Management Studio (SSMS)

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/restaurant-management-database.git
