-- ����������� ch_nn_person_id �����������, ��� � ������� person_id �� ����� ������ �������� (NULL)
AlTER TABLE person_discounts 
    ADD CONSTRAINT ch_nn_person_id
        CHECK (person_id IS NOT NULL );

-- ����������� ch_nn_pizzeria_id �����������, ��� � ������� pizzeria_id �� ����� ������ �������� (NULL)
AlTER TABLE person_discounts 
    ADD CONSTRAINT ch_nn_pizzeria_id
        CHECK (pizzeria_id IS NOT NULL );

-- ����������� ch_nn_discount �����������, ��� � ������� discount �� ����� ������ �������� (NULL)
AlTER TABLE person_discounts 
    ADD CONSTRAINT ch_nn_discount
        CHECK (discount IS NOT NULL );

-- ��� ������� discount ��������������� ��������� �������� 0
AlTER TABLE person_discounts 
ALTER COLUMN discount 
SET DEFAULT 0;

-- ����������� ch_range_discount �����������, ��� � ������� person_discounts.discount �������� ����� �� 0  �� 100
AlTER TABLE person_discounts 
    ADD CONSTRAINT ch_range_discount
        CHECK (person_discounts.discount BETWEEN 0 AND 100);