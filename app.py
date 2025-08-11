# app.py
# Simple Library Management CLI using SQLite

import sqlite3
from pathlib import Path

DB_FILE = "library.db"

def init_db():
    """Create the database and load schema + sample data."""
    with sqlite3.connect(DB_FILE) as conn:
        cursor = conn.cursor()

        # Load schema
        with open("schema.sql", "r", encoding="utf-8") as f:
            cursor.executescript(f.read())

        # Load sample data
        with open("data.sql", "r", encoding="utf-8") as f:
            cursor.executescript(f.read())

    print("✅ Database initialized with schema and sample data.")

def list_books():
    """List all books with their authors."""
    with sqlite3.connect(DB_FILE) as conn:
        cursor = conn.cursor()
        cursor.execute("""
            SELECT b.book_id, b.title, a.name AS author, b.genre, b.year_published, 
                   CASE WHEN b.available = 1 THEN 'Yes' ELSE 'No' END AS available
            FROM Books b
            JOIN Authors a ON b.author_id = a.author_id
            ORDER BY b.title;
        """)
        rows = cursor.fetchall()

        print("\n📚 All Books:")
        for row in rows:
            print(f"{row[0]}. {row[1]} — {row[2]} ({row[3]}, {row[4]}) | Available: {row[5]}")

def borrowed_books():
    """Show currently borrowed books."""
    with sqlite3.connect(DB_FILE) as conn:
        cursor = conn.cursor()
        cursor.execute("""
            SELECT b.title, m.name, l.loan_date
            FROM Loans l
            JOIN Books b ON l.book_id = b.book_id
            JOIN Members m ON l.member_id = m.member_id
            WHERE l.return_date IS NULL;
        """)
        rows = cursor.fetchall()

        print("\n📖 Borrowed Books:")
        for row in rows:
            print(f"{row[0]} — Borrowed by {row[1]} on {row[2]}")

def menu():
    """Simple CLI menu."""
    while True:
        print("\n--- Library Management Menu ---")
        print("1. Initialize database")
        print("2. List all books")
        print("3. Show borrowed books")
        print("4. Exit")
        choice = input("Enter choice: ")

        if choice == "1":
            init_db()
        elif choice == "2":
            list_books()
        elif choice == "3":
            borrowed_books()
        elif choice == "4":
            print("👋 Goodbye!")
            break
        else:
            print("❌ Invalid choice, try again.")

if __name__ == "__main__":
    # Auto-create DB file if it doesn't exist
    if not Path(DB_FILE).exists():
        init_db()
    menu()
