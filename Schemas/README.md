# Database Schemas

This directory contains common database schemas used in LeetCode SQL problems.

## Files

### common_schemas.sql
Contains the most frequently used table structures in LeetCode problems including:

**Core Business Tables:**
- Employee (id, name, salary, departmentId, managerId)
- Department (id, name)
- Customer (id, name, email, referrerId)
- Orders (id, customerId, orderDate, amount)

**User Activity Tables:**
- Person (id, email, firstName, lastName)
- Activity (player_id, device_id, event_date, games_played)
- Logs (id, num)

**Domain-Specific Tables:**
- Sales & Product (for e-commerce problems)
- Students & Courses (for education problems)
- Weather (for date/temperature problems)
- Cinema (for entertainment problems)
- Tree (for hierarchical data problems)

## Usage

1. Copy the relevant schema definitions to your SQL environment
2. Uncomment and modify the sample data inserts as needed
3. Use these schemas to test your solutions locally

## Notes

- All schemas follow standard LeetCode conventions
- Primary keys and foreign key relationships are defined where applicable
- Sample data is provided in comments for quick testing
- Schemas are compatible with MySQL, PostgreSQL, and SQL Server