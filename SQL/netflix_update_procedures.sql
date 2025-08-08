
-- Modificar Type_Title
CREATE OR REPLACE FUNCTION netflix.sp_update_type_title(
    p_id_type INT,
    p_name VARCHAR(500) DEFAULT NULL,
    p_state BOOLEAN DEFAULT NULL
)
RETURNS VARCHAR(200) AS $$
DECLARE
    v_count INT;
    v_message VARCHAR(200);
BEGIN
    SELECT COUNT(*) INTO v_count 
    FROM netflix.Type_Title 
    WHERE id_type = p_id_type;
    
    IF v_count = 0 THEN
        RETURN 'Error: No existe un tipo de título con ID: ' || p_id_type;
    END IF;
    
    UPDATE netflix.Type_Title 
    SET 
        name = COALESCE(p_name, name),
        state = COALESCE(p_state, state)
    WHERE id_type = p_id_type;
    
    v_message := 'Tipo de título actualizado exitosamente. ID: ' || p_id_type;
    RETURN v_message;
    
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error al actualizar tipo de título: ' || SQLERRM;
END;
$$ LANGUAGE plpgsql;

-- Modificar Director
CREATE OR REPLACE FUNCTION netflix.sp_update_director(
    p_id_director INT,
    p_name VARCHAR(500) DEFAULT NULL,
    p_state BOOLEAN DEFAULT NULL
)
RETURNS VARCHAR(200) AS $$
DECLARE
    v_count INT;
    v_message VARCHAR(200);
BEGIN
    SELECT COUNT(*) INTO v_count 
    FROM netflix.Director 
    WHERE id_director = p_id_director;
    
    IF v_count = 0 THEN
        RETURN 'Error: No existe un director con ID: ' || p_id_director;
    END IF;
    
    UPDATE netflix.Director 
    SET 
        name = COALESCE(p_name, name),
        state = COALESCE(p_state, state)
    WHERE id_director = p_id_director;
    
    v_message := 'Director actualizado exitosamente. ID: ' || p_id_director;
    RETURN v_message;
    
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error al actualizar director: ' || SQLERRM;
END;
$$ LANGUAGE plpgsql;

-- Modificar Rating
CREATE OR REPLACE FUNCTION netflix.sp_update_rating(
    p_id_rating INT,
    p_rating_name VARCHAR(500) DEFAULT NULL,
    p_state BOOLEAN DEFAULT NULL
)
RETURNS VARCHAR(200) AS $$
DECLARE
    v_count INT;
    v_message VARCHAR(200);
BEGIN
    SELECT COUNT(*) INTO v_count 
    FROM netflix.Rating 
    WHERE id_rating = p_id_rating;
    
    IF v_count = 0 THEN
        RETURN 'Error: No existe un rating con ID: ' || p_id_rating;
    END IF;
    
    UPDATE netflix.Rating 
    SET 
        rating_name = COALESCE(p_rating_name, rating_name),
        state = COALESCE(p_state, state)
    WHERE id_rating = p_id_rating;
    
    v_message := 'Rating actualizado exitosamente. ID: ' || p_id_rating;
    RETURN v_message;
    
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error al actualizar rating: ' || SQLERRM;
END;
$$ LANGUAGE plpgsql;

-- Modificar Duration
CREATE OR REPLACE FUNCTION netflix.sp_update_duration(
    p_id_duration INT,
    p_duration_value INT DEFAULT NULL,
    p_duration_unit VARCHAR(500) DEFAULT NULL,
    p_state BOOLEAN DEFAULT NULL
)
RETURNS VARCHAR(200) AS $$
DECLARE
    v_count INT;
    v_message VARCHAR(200);
BEGIN
    SELECT COUNT(*) INTO v_count 
    FROM netflix.Duration 
    WHERE id_duration = p_id_duration;
    
    IF v_count = 0 THEN
        RETURN 'Error: No existe una duración con ID: ' || p_id_duration;
    END IF;
    
    IF p_duration_value IS NOT NULL AND p_duration_value <= 0 THEN
        RETURN 'Error: El valor de duración debe ser mayor a 0';
    END IF;
    
    UPDATE netflix.Duration 
    SET 
        duration_value = COALESCE(p_duration_value, duration_value),
        duration_unit = COALESCE(p_duration_unit, duration_unit),
        state = COALESCE(p_state, state)
    WHERE id_duration = p_id_duration;
    
    v_message := 'Duración actualizada exitosamente. ID: ' || p_id_duration;
    RETURN v_message;
    
EXCEPTION
    WHEN OTHERS THEN
        RETURN 'Error al actualizar duración: ' || SQLERRM;
END;
$$ LANGUAGE plpgsql;
