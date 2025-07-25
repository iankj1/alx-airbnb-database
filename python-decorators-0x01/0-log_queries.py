import sqlite3
import functools

# Decorator to log SQL queries
def log_queries(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        # Extract the SQL query from args or kwargs
        query = kwargs.get('query') if 'query' in kwargs else args[0] if args else None
        if query:
            print(f"[LOG] Executing SQL Query: {query}")
        else:
            print("[LOG] No SQL query provided.")
        return func(*args, **kwargs)
    return wrapper

@log_queries
def fetch_all_users(query):
    conn = sqlite3.connect('users.db')
    cursor = conn.cursor()
    cursor.execute(query)
    results = cursor.fetchall()
    conn.close()
    return results

# Example usage
if __name__ == "__main__":
    users = fetch_all_users(query="SELECT * FROM users")
    print(users)
