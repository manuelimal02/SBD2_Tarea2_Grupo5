
-- Insertar Type_Title
CREATE OR REPLACE PROCEDURE netflix.insert_type_title(
    p_id_type INT,
    p_name VARCHAR,
    p_state BOOLEAN DEFAULT TRUE
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO netflix.Type_Title (id_type, name, state)
    VALUES (p_id_type, p_name, p_state);
END;
$$;

-- Insertar Director
CREATE OR REPLACE PROCEDURE netflix.insert_director(
    p_id_director INT,
    p_name VARCHAR,
    p_state BOOLEAN DEFAULT TRUE
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO netflix.Director (id_director, name, state)
    VALUES (p_id_director, p_name, p_state);
END;
$$;

-- Insertar Rating
CREATE OR REPLACE PROCEDURE netflix.insert_rating(
    p_id_rating INT,
    p_rating_name VARCHAR,
    p_state BOOLEAN DEFAULT TRUE
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO netflix.Rating (id_rating, rating_name, state)
    VALUES (p_id_rating, p_rating_name, p_state);
END;
$$;

-- Insertar Duration
CREATE OR REPLACE PROCEDURE netflix.insert_duration(
    p_id_duration INT,
    p_duration_value INT,
    p_duration_unit VARCHAR,
    p_state BOOLEAN DEFAULT TRUE
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO netflix.Duration (id_duration, duration_value, duration_unit, state)
    VALUES (p_id_duration, p_duration_value, p_duration_unit, p_state);
END;
$$;
