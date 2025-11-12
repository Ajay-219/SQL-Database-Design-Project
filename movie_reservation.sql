-- Database: MovieReservationSystem
CREATE DATABASE IF NOT EXISTS MovieReservationSystem;
USE MovieReservationSystem;

-- Table: Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password VARCHAR(100)
);

-- Table: Movies
CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100),
    genre VARCHAR(50),
    duration INT
);

-- Table: Bookings
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    seats INT,
    total_amount DECIMAL(10,2),
    booking_date DATETIME DEFAULT NOW(),
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (movie_id) REFERENCES Movies(movie_id)
);

-- Insert sample data
INSERT INTO Users (name, email, password) VALUES
('Ajay', 'ajay@example.com', 'hashed_pw'),
('Sita', 'sita@example.com', 'hashed_pw');

INSERT INTO Movies (title, genre, duration) VALUES
('Inception', 'Sci-Fi', 148),
('RRR', 'Action', 175);

INSERT INTO Bookings (user_id, movie_id, seats, total_amount)
VALUES (1, 2, 3, 900.00);

-- Example query: View user bookings
SELECT U.name, M.title, B.seats, B.total_amount, B.booking_date
FROM Bookings B
JOIN Users U ON B.user_id = U.user_id
JOIN Movies M ON B.movie_id = M.movie_id;
