# Elevate-task-1-S-K-
# Library System Database

This repository contains the SQL script for setting up a simple Library System database. It includes table creations, relationships, and sample data.

## Database Schema

The database consists of the following tables:

* **Members**: Stores information about library members.
* **Genres**: Categorizes books into different genres.
* **Books**: Contains details about the books available in the library.
* **Borrowings**: Records each instance of a member borrowing books.
* **Borrow_Items**: Details the specific books borrowed within each borrowing transaction.

## Table Descriptions

### `Members`

| Column Name | Type | Description |
| :---------- | :--- | :---------- |
| `member_id` | `INT` | Primary Key, Auto-incrementing unique ID for the member. |
| `name` | `VARCHAR(100)` | Name of the member. |
| `email` | `VARCHAR(100)` | Unique email address of the member. |
| `address` | `VARCHAR(255)` | Address of the member. |

### `Genres`

| Column Name | Type | Description |
| :---------- | :--- | :---------- |
| `genre_id` | `INT` | Primary Key, Auto-incrementing unique ID for the genre. |
| `genre_name` | `VARCHAR(100)` | Name of the genre (e.g., 'Fiction', 'Science'). |

### `Books`

| Column Name | Type | Description |
| :---------- | :--- | :---------- |
| `book_id` | `INT` | Primary Key, Auto-incrementing unique ID for the book. |
| `title` | `VARCHAR(150)` | Title of the book. |
| `author` | `VARCHAR(100)` | Author of the book. |
| `price` | `DECIMAL(8, 2)` | Price of the book. |
| `stock` | `INT` | Number of copies of the book currently in stock. |
| `genre_id` | `INT` | Foreign Key, references `genre_id` in the `Genres` table. |

### `Borrowings`

| Column Name | Type | Description |
| :---------- | :--- | :---------- |
| `borrowing_id` | `INT` | Primary Key, Auto-incrementing unique ID for the borrowing transaction. |
| `member_id` | `INT` | Foreign Key, references `member_id` in the `Members` table. |
| `borrow_date` | `DATE` | Date when the books were borrowed. |
| `return_date` | `DATE` | Date when the books are returned (NULL if not yet returned). |

### `Borrow_Items`

| Column Name | Type | Description |
| :---------- | :--- | :---------- |
| `borrow_item_id` | `INT` | Primary Key, Auto-incrementing unique ID for each borrowed item. |
| `borrowing_id` | `INT` | Foreign Key, references `borrowing_id` in the `Borrowings` table. |
| `book_id` | `INT` | Foreign Key, references `book_id` in the `Books` table. |
| `quantity` | `INT` | Quantity of the specific book borrowed in this transaction. |

## Setup and Usage

To set up the database, you can execute the `library_system.sql` script in your MySQL client.

1.  **Create the database:**
    ```sql
    CREATE DATABASE library_system;
    ```
2.  **Use the database:**
    ```sql
    USE library_system;
    ```
3.  **Execute the schema and data insertion script:**
    ```sql
    SOURCE path/to/your/library_system.sql;
    ```
    (Replace `path/to/your/library_system.sql` with the actual path to the downloaded SQL file.)

## Sample Data

The `library_system.sql` file includes sample data for all tables to help you get started and test queries.

### Sample Members
* Anjali Sharma (anjali@example.com)
* Rahul Mehra (rahul@example.com)
* Sneha Iyer (sneha@example.com)
* Amit Khanna (amit@example.com)

### Sample Genres
* Fiction
* Non-Fiction
* Science
* Technology

### Sample Books
* The Alchemist (Fiction)
* Sapiens (Non-Fiction)
* A Brief History of Time (Science)
* Introduction to Algorithms (Technology)

### Sample Borrowings
* Anjali Sharma borrowed 'The Alchemist' and 'A Brief History of Time'.
* Rahul Mehra borrowed 'Sapiens'.
* Sneha Iyer borrowed 'Introduction to Algorithms'.

## Contributing

Feel free to fork this repository, suggest improvements, or add more complex queries and features.
