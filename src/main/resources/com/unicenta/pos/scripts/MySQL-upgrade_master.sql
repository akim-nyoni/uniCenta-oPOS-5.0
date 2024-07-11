-- CLEAR THE DECKS
DELETE FROM sharedtickets;

-- Switch OFF table foreign key relationships
set foreign_key_checks = 0;

-- RECREATE applications table
DROP TABLE `applications`;
CREATE TABLE IF NOT EXISTS `applications` (
	`id` varchar(255) NOT NULL,
	`name` varchar(255) NOT NULL,
	`version` varchar(255) NOT NULL,
	`instdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	PRIMARY KEY  ( `id` )
) ENGINE = InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT = Compact;


-- SYSTEM
DELETE FROM resources WHERE name = 'script.posapps';


DELETE FROM resources WHERE id = '0';
DELETE FROM resources WHERE id = '00';
INSERT INTO resources(id, name, restype, content) VALUES('00', 'Menu.Root', 0, $FILE{/com/unicenta/pos/templates/Menu.Root.txt});

UPDATE resources SET content = $FILE{/com/unicenta/pos/templates/Ticket.Buttons.xml} WHERE name = 'Ticket.Buttons';
COMMIT;

UPDATE resources SET content = $FILE{/com/unicenta/pos/templates/Printer.Ticket.xml} WHERE name = 'Printer.Ticket';
COMMIT;

UPDATE resources SET content = $FILE{/com/unicenta/pos/templates/Ticket.Close.xml} WHERE name = 'Ticket.Close';
COMMIT;

UPDATE resources SET content = $FILE{/com/unicenta/pos/templates/Cash.Close.xml} WHERE name = 'Cash.Close';
COMMIT;

UPDATE resources SET content = $FILE{/com/unicenta/pos/templates/customer.created.xml} WHERE name = 'Customer.Created';
COMMIT;

UPDATE resources SET content = $FILE{/com/unicenta/pos/templates/customer.deleted.xml} WHERE name = 'Customer.Deleted';
COMMIT;

UPDATE resources SET content = $FILE{/com/unicenta/pos/templates/customer.updated.xml} WHERE name = 'Customer.Updated';
COMMIT;


-- ROLES
DELETE FROM roles WHERE id = '0';
INSERT INTO roles(id, name, permissions) VALUES('0', 'Administrator role', $FILE{/com/unicenta/pos/templates/Role.Administrator.xml} );
DELETE FROM roles WHERE id = '1';
INSERT INTO roles(id, name, permissions) VALUES('1', 'Manager role', $FILE{/com/unicenta/pos/templates/Role.Manager.xml} );
DELETE FROM roles WHERE id = '2';
INSERT INTO roles(id, name, permissions) VALUES('2', 'Employee role', $FILE{/com/unicenta/pos/templates/Role.Employee.xml} );


-- Switch ON table foreign key relationships
set foreign_key_checks = 1;

INSERT INTO applications(id, name, version) VALUES($APP_ID{}, $APP_NAME{}, $APP_VERSION{});

COMMIT;