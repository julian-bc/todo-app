CREATE DATABASE todo_app;

USE todo_app;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255)
);

CREATE TABLE todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255),
    completed BOOLEAN DEFAULT false,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE shared_todos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    todo_id INT,
    user_id INT,
    shared_with_id INT,
    FOREIGN KEY (todo_id) REFERENCES todos(id) ON DELETE CASCADE,
    FOREIGN KEY (shared_with_id) REFERENCES users(id) ON DELETE CASCADE
);

-- insert into the users table
INSERT INTO users (name, email, password) VALUES ('Johnny', 'johnny@gmail.com', 'password123');
INSERT INTO users (name, email, password) VALUES ('Daniel', 'daniel@gmail.com', 'password456');

-- default todos
INSERT INTO todos (title, user_id) 
VALUES
('Go Skateboarding 🛹', 1),
('Grocery Shopping 🛒', 1),
('Read a Chapter 📚', 1),
('Work on Project 💻', 1),
('Exercise 🏋️', 1),
('Check Emails 📧', 1),
('Clean the House 🧹', 1)

-- shared todo 1 of user 1 with user 2
INSERT INTO shared_todos (todo_id, user_id, shared_with_id) VALUES (1, 1, 2);

-- get todos including shared todos
SELECT todos.*, shared_todos.shared_with_id 
FROM todos
LEFT JOIN shared_todos ON todos.id = shared_todos.todo_id
WHERE todos.user_id = [user_id] OR shared_todos.shared_with_id = [user_id];