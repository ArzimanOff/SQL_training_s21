-- ограничение ch_nn_person_id гарантирует, что в колонке person_id не будет пустых значений (NULL)
AlTER TABLE person_discounts 
    ADD CONSTRAINT ch_nn_person_id
        CHECK (person_id IS NOT NULL );

-- ограничение ch_nn_pizzeria_id гарантирует, что в колонке pizzeria_id не будет пустых значений (NULL)
AlTER TABLE person_discounts 
    ADD CONSTRAINT ch_nn_pizzeria_id
        CHECK (pizzeria_id IS NOT NULL );

-- ограничение ch_nn_discount гарантирует, что в колонке discount не будет пустых значений (NULL)
AlTER TABLE person_discounts 
    ADD CONSTRAINT ch_nn_discount
        CHECK (discount IS NOT NULL );

-- для колонки discount устанавливается дефолтное значение 0
AlTER TABLE person_discounts 
ALTER COLUMN discount 
SET DEFAULT 0;

-- ограничение ch_range_discount гарантирует, что в колонке person_discounts.discount значения будут от 0  до 100
AlTER TABLE person_discounts 
    ADD CONSTRAINT ch_range_discount
        CHECK (person_discounts.discount BETWEEN 0 AND 100);