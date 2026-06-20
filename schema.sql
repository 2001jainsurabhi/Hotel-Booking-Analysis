CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_segment VARCHAR(20) NOT NULL,
    customer_signup_date DATE NOT NULL,
    customer_home_city VARCHAR(100),
    customer_loyalty_tier VARCHAR(20) NOT NULL
);

CREATE TABLE properties (
    property_id INT PRIMARY KEY,
    property_name VARCHAR(150) NOT NULL,
    property_city VARCHAR(100) NOT NULL,
    property_star_rating INT NOT NULL,
    property_type VARCHAR(50),
    property_total_rooms INT NOT NULL,

    UNIQUE(property_name, property_city)
);

CREATE TABLE bookings (
    booking_id INT PRIMARY KEY,

    customer_id INT NOT NULL,
    property_id INT NOT NULL,

    booking_date DATE NOT NULL,
    checkin_date DATE NOT NULL,
    checkout_date DATE NOT NULL,

    room_type VARCHAR(50),
    num_rooms INT NOT NULL,
    nights INT NOT NULL,

    booking_channel VARCHAR(50),

    adr DECIMAL(12,2),
    discount_amount DECIMAL(12,2),
    coupon_code VARCHAR(50),

    total_amount DECIMAL(12,2),

    payment_method VARCHAR(50),
    booking_status VARCHAR(20),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (property_id)
        REFERENCES properties(property_id),

    CHECK (
        checkout_date > checkin_date
    )
);

CREATE TABLE reviews (

    booking_id INT PRIMARY KEY,

    review_rating DECIMAL(5,2),

    review_date DATE,

    FOREIGN KEY (booking_id)
        REFERENCES bookings(booking_id)
);

CREATE INDEX idx_customer_id
ON bookings(customer_id);



-- customer_id in the bookings table is indexed because the analytical queries 
-- frequently partition, filter, and aggregate booking records by customer. This 
-- improves performance for customer-level analysis and ROW_NUMBER() calculations.