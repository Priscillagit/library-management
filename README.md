
# 📚 Library Management System (SQLite + Python)

A simple **Library Management** database project built with **SQLite** and **Python**.  
This project demonstrates basic database design, SQL queries, and a command-line interface (CLI) for interacting with the data.  

---

## 📌 Features
- **Database schema** for authors, books, members, and loans.
- **Sample data** to quickly set up a working library.
- **Example SQL queries** for common reports.
- **Python CLI app** to:
  - Initialize the database
  - List all books
  - Show currently borrowed books

---

## 🗂 Project Structure
library-management/
│── schema.sql # Database tables
│── data.sql # Sample data
│── queries.sql # Example SQL queries
│── app.py # Python CLI app
│── README.md # Project documentation
│── .gitignore # Git ignore rules
│── LICENSE # Project license

---

## ⚙️ Setup & Usage

### 1️⃣ Clone the repository
```bash
git clone https://github.com/priscillagit/library-management.git
cd library-management

2️⃣ Create a Python virtual environment (optional but recommended)
bash
Copy
Edit
python -m venv venv
# Activate:
#   macOS/Linux: source venv/bin/activate

#   Windows: venv\Scripts\activate
3️⃣ Run the app
bash
Copy
Edit
python app.py

🗄 Database Schema
Tables:
Authors – Stores author information
Books – Stores book details, linked to authors
Members – People who borrow books
Loans – Records of borrowed books

📝 Example SQL Queries
See queries.sql for:
All books with authors
Borrowed books list
Borrow count per member
Search books by author
Overdue books (14+ days)

📦 Technologies Used
SQLite3 – Lightweight relational database
Python 3 – CLI app to interact with DB
SQL – Database design and queries

📄 License
This project is licensed under the MIT License.

🚀 Future Improvements
Add a web UI using Flask or Django
Enable book returns via CLI
Track late fees
Add search/filter options



