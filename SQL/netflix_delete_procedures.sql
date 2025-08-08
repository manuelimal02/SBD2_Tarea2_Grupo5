
-- Eliminar Type_Title
CREATE OR REPLACE FUNCTION netflix.eliminar_type_title(id_param INT)
RETURNS TEXT AS $$
BEGIN
    UPDATE netflix.Type_Title
    SET state = FALSE
    WHERE id_type = id_param;

    IF FOUND THEN
        RETURN 'Tipo de título eliminado correctamente (estado = FALSE).';
    ELSE
        RETURN 'No se encontró ningún tipo de título con ese ID.';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Eliminar Director
CREATE OR REPLACE FUNCTION netflix.eliminar_director(id_param INT)
RETURNS TEXT AS $$
BEGIN
    UPDATE netflix.Director
    SET state = FALSE
    WHERE id_director = id_param;

    IF FOUND THEN
        RETURN 'Director eliminado correctamente (estado = FALSE).';
    ELSE
        RETURN 'No se encontró ningún director con ese ID.';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Eliminar Rating
CREATE OR REPLACE FUNCTION netflix.eliminar_rating(id_param INT)
RETURNS TEXT AS $$
BEGIN
    UPDATE netflix.Rating
    SET state = FALSE
    WHERE id_rating = id_param;

    IF FOUND THEN
        RETURN 'Rating eliminado correctamente (estado = FALSE).';
    ELSE
        RETURN 'No se encontró ningún rating con ese ID.';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Eliminar Duration
CREATE OR REPLACE FUNCTION netflix.eliminar_duration(id_param INT)
RETURNS TEXT AS $$
BEGIN
    UPDATE netflix.Duration
    SET state = FALSE
    WHERE id_duration = id_param;

    IF FOUND THEN
        RETURN 'Duración eliminada correctamente (estado = FALSE).';
    ELSE
        RETURN 'No se encontró ninguna duración con ese ID.';
    END IF;
END;
$$ LANGUAGE plpgsql;
