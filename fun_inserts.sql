USE Slinkina_7lab;

INSERT INTO requests (`quote`, `description`, `desired_time`, `priority_id`) VALUES (3, 'эаэаэ', '2023-01-01 12:00:00', 2);

DELETE FROM requests WHERE id = 1;
INSERT INTO requests (`quote`, `description`, `desired_time`, `priority_id`) VALUES (3, 'геншин инфаркт', '2023-01-01 10:00:00', 1);
SET @request_id = LAST_INSERT_ID();

INSERT INTO employees_requests (employee, request) VALUES(1, @request_id);

UPDATE requests SET `quote` = 4 WHERE `id` = 1;
INSERT INTO requests (`quote`, `description`, `desired_time`, `priority_id`) VALUES (20, 'поставьте пять', '2023-04-02 20:31:31', 1);
SET @request_id = LAST_INSERT_ID();

INSERT INTO employees_requests (employee, request) VALUES(2, @request_id);

