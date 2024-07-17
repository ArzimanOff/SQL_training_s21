CREATE UNIQUE INDEX idx_person_discounts_unique
    ON person_discounts(person_id, pizzeria_id);

-- нужно выполнить в качестве примера работоспособности
-- SET enable_seqscan = OFF;
-- EXPLAIN (ANALYSE, TIMING OFF)
-- SELECT * FROM person_discounts
--          WHERE person_id = 1
--            AND pizzeria_id = 1;