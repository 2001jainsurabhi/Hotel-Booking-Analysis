WITH customer_bookings AS (

    SELECT
        customer_id,
        total_amount,

        ROW_NUMBER() OVER (
            PARTITION BY customer_id
            ORDER BY checkin_date
        ) AS booking_sequence

    FROM hotel_bookings_flat

    WHERE booking_status='Completed'
)

SELECT

    CASE
        WHEN booking_sequence = 1
            THEN 'First Booking'

        WHEN booking_sequence = 2
            THEN 'Second Booking'

        ELSE 'Third or Later'
    END AS sequence_label,

    ROUND(
        AVG(total_amount),
        2
    ) AS avg_total,

    COUNT(*) AS n

FROM customer_bookings

GROUP BY

    CASE
        WHEN booking_sequence = 1
            THEN 'First Booking'

        WHEN booking_sequence = 2
            THEN 'Second Booking'

        ELSE 'Third or Later'
    END;
    
    -- The average booking value is highest for customers' first bookings (₹33,574.92). 
    -- The second booking shows a slight decline (₹30,879.13), while third or later 
    -- bookings stabilize at approximately ₹31,462.04. This suggests that customer 
    -- spending remains relatively consistent after the initial booking, indicating 
    -- healthy repeat-booking behavior. 
    
    -- Normalize Corporate reviews from 1–10 scale to 1–5 scale before averaging.
    
    SELECT

    property_name,
    property_city,

    COUNT(*) AS num_reviews,

    ROUND(
        AVG(
            CASE
                WHEN customer_segment = 'Corporate'
                THEN CAST(review_rating AS DECIMAL(10,2)) / 2
                ELSE CAST(review_rating AS DECIMAL(10,2))
            END
        ),
        2
    ) AS normalized_avg_rating

FROM hotel_bookings_flat

WHERE review_rating IS NOT NULL
AND review_rating <> ''

GROUP BY
    property_name,
    property_city

HAVING COUNT(*) >= 20

ORDER BY normalized_avg_rating DESC

LIMIT 5;


-- ## C-Q2. Top Properties by Normalized Review Rating

-- To ensure fair comparison across customer segments, Corporate customer reviews were normalized from a 1–10 scale to a 1–5 scale before calculating average ratings.

-- Among properties with at least 20 reviews, Hilltop Inn (Udaipur), Indigo Lodge (Bangalore), and Ivory Retreat (Jaipur) achieved the highest normalized average rating of 3.92.

-- The relatively small difference between the top-ranked properties suggests a generally consistent guest experience across highly rated hotels. These properties can be considered benchmark performers and may provide operational best practices that can be replicated across the portfolio.
 
    
    
    