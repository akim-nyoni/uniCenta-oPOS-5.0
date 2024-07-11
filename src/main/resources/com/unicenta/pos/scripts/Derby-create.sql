
CREATE TABLE applications (
	 id varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	 version varchar(255) NOT NULL,
	 instdate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	PRIMARY KEY (id)
);

CREATE TABLE attribute (
	 id varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE attributeinstance (
	 id varchar(255) NOT NULL,
	 attributesetinstance_id varchar(255) NOT NULL,
	 attribute_id varchar(255) NOT NULL,
	 value varchar(255) default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE attributeset (
	 id varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE attributesetinstance (
	 id varchar(255) NOT NULL,
	 attributeset_id varchar(255) NOT NULL,
	 description varchar(255) default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE attributeuse (
	 id varchar(255) NOT NULL,
	 attributeset_id varchar(255) NOT NULL,
	 attribute_id varchar(255) NOT NULL,
	 lineno smallint default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE attributevalue (
	 id varchar(255) NOT NULL,
	 attribute_id varchar(255) NOT NULL,
	 value varchar(255) default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE breaks (
	 id varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	 visible smallint NOT NULL default 1 ,
	 notes varchar(255) default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE categories (
	 id varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	 parentid varchar(255) default NULL,
	 image blob default NULL,
	 texttip varchar(255) default NULL,
	 catshowname smallint NOT NULL default 1 ,
	 catorder varchar(255) default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE closedcash (
	 money varchar(255) NOT NULL,
	 host varchar(255) NOT NULL,
	 hostsequence smallint NOT NULL,
	 datestart timestamp NOT NULL,
	 dateend timestamp default NULL,
	 nosales smallint NOT NULL default 0 ,
	PRIMARY KEY (money)
);

CREATE TABLE csvimport (
	 id varchar(255) NOT NULL,
	 rownumber varchar(255) default NULL,
	 csverror varchar(255) default NULL,
	 reference varchar(255) default NULL,
	 code varchar(255) default NULL,
	 name varchar(255) default NULL,
	 pricebuy double default NULL,
	 pricesell double default NULL,
	 previousbuy double default NULL,
	 previoussell double default NULL,
	 category varchar(255) default NULL,
	 tax varchar(255) default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE customers (
	 id varchar(255) NOT NULL,
	 searchkey varchar(255) NOT NULL,
	 taxid varchar(255) default NULL,
	 name varchar(255) NOT NULL,
	 taxcategory varchar(255) default NULL,
	 card varchar(255) default NULL,
	 maxdebt double NOT NULL default 0 ,
	 address varchar(255) default NULL,
	 address2 varchar(255) default NULL,
	 postal varchar(255) default NULL,
	 city varchar(255) default NULL,
	 region varchar(255) default NULL,
	 country varchar(255) default NULL,
	 firstname varchar(255) default NULL,
	 lastname varchar(255) default NULL,
	 email varchar(255) default NULL,
	 phone varchar(255) default NULL,
	 phone2 varchar(255) default NULL,
	 fax varchar(255) default NULL,
	 notes varchar(255) default NULL,
	 visible smallint NOT NULL default 1 ,
	 curdate timestamp default NULL,
	 curdebt double default 0 ,
	 image blob default NULL,
	 isvip smallint NOT NULL default 0 ,
	 discount double default 0 ,
	 memodate timestamp default CURRENT_TIMESTAMP ,
	PRIMARY KEY (id)
);

CREATE TABLE draweropened (
	 opendate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	 name varchar(255) default NULL,
	 ticketid varchar(255) default NULL
);

CREATE TABLE floors (
	 id varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	 image blob default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE leaves (
	 id varchar(255) NOT NULL,
	 pplid varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	 startdate timestamp NOT NULL,
	 enddate timestamp NOT NULL,
	 notes varchar(255) default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE lineremoved (
	 removeddate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	 name varchar(255) default NULL,
	 ticketid varchar(255) default NULL,
	 productid varchar(255) default NULL,
	 productname varchar(255) default NULL,
	 units double NOT NULL
);

CREATE TABLE locations (
	 id varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	 address varchar(255) default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE moorers (
	 vesselname varchar(255) default NULL,
	 size smallint default NULL,
	 days smallint default NULL,
	 power smallint NOT NULL default 0
);

CREATE TABLE orders (
  id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY(Start with 1, Increment by 1),
  orderid varchar(50) DEFAULT NULL,
  qty smallint DEFAULT 1 ,
  details varchar(255) DEFAULT NULL,
  attributes varchar(255) DEFAULT NULL,
  notes varchar(255) DEFAULT NULL,
  ticketid varchar(50) DEFAULT NULL,
  ordertime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  displayid smallint DEFAULT 1 ,
  auxiliary smallint DEFAULT NULL,
  completetime timestamp DEFAULT NULL
);

CREATE TABLE payments (
	 id varchar(255) NOT NULL,
	 receipt varchar(255) NOT NULL,
	 payment varchar(255) NOT NULL,
	 total double NOT NULL default 0 ,
	 tip double default 0 ,
	 transid varchar(255) default NULL,
	 isprocessed smallint default 0 ,
	 returnmsg blob default NULL,
	 notes varchar(255) default NULL,
	 tendered double default NULL,
	 cardname varchar(255) default NULL,
   voucher varchar(255) default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE people (
	 id varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	 apppassword varchar(255) default NULL,
	 card varchar(255) default NULL,
	 role varchar(255) NOT NULL,
	 visible smallint NOT NULL,
	 image blob default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE pickup_number (
	 id smallint NOT NULL default 0
);

CREATE TABLE places (
	 id varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	 seats varchar(6) NOT NULL DEFAULT '1' ,
	 x smallint NOT NULL,
	 y smallint NOT NULL,
	 floor varchar(255) NOT NULL,
	 customer varchar(255) default NULL,
	 waiter varchar(255) default NULL,
	 ticketid varchar(255) default NULL,
	 tablemoved smallint NOT NULL default 0 ,
	 width smallint NOT NULL,
	 height smallint NOT NULL,
  guests smallint DEFAULT 0,
  occupied timestamp DEFAULT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE products (
	 id varchar(255) NOT NULL,
	 reference varchar(255) NOT NULL,
	 code varchar(255) NOT NULL,
	 codetype varchar(255) default NULL,
	 name varchar(255) NOT NULL,
	 pricebuy double NOT NULL default 0 ,
	 pricesell double NOT NULL default 0 ,
	 category varchar(255) NOT NULL,
	 taxcat varchar(255) NOT NULL,
	 attributeset_id varchar(255) default NULL,
	 stockcost double NOT NULL default 0 ,
	 stockvolume double NOT NULL default 0 ,
	 image blob default NULL,
	 iscom smallint NOT NULL default 0 ,
	 isscale smallint NOT NULL default 0 ,
	 isconstant smallint NOT NULL default 0 ,
	 printkb smallint NOT NULL default 0 ,
	 sendstatus smallint NOT NULL default 0 ,
	 isservice smallint NOT NULL default 0 ,
	 attributes blob default NULL,
	 display varchar(255) default NULL,
	 isvprice smallint NOT NULL default 0 ,
	 isverpatrib smallint NOT NULL default 0 ,
	 texttip varchar(255) default NULL,
	 warranty smallint NOT NULL default 0 ,
	 stockunits double NOT NULL default 0 ,
	 printto varchar(255) default '1' ,
	 supplier varchar(255) default NULL,
   	 uom varchar(255) default '0' ,
	 memodate timestamp default '2018-01-01 00:00:01' ,
	PRIMARY KEY (id)
);

CREATE TABLE products_bundle (
  id varchar(255) NOT NULL,
  product VARCHAR(255) NOT NULL,
  product_bundle VARCHAR(255) NOT NULL,
  quantity DOUBLE NOT NULL,
 PRIMARY KEY (id)
);

CREATE TABLE products_cat (
	 product varchar(255) NOT NULL,
	 catorder smallint default NULL,
	PRIMARY KEY (product)
);

CREATE TABLE products_com (
	 id varchar(255) NOT NULL,
	 product varchar(255) NOT NULL,
	 product2 varchar(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE receipts (
	 id varchar(255) NOT NULL,
	 money varchar(255) NOT NULL,
	 datenew timestamp NOT NULL,
	 attributes blob default NULL,
	 person varchar(255) default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE reservation_customers (
	 id varchar(255) NOT NULL,
	 customer varchar(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE reservations (
	 id varchar(255) NOT NULL,
	 created timestamp NOT NULL,
	 datenew timestamp NOT NULL default '2018-01-01 00:00:00' ,
	 title varchar(255) NOT NULL,
	 chairs smallint NOT NULL,
	 isdone smallint NOT NULL,
	 description varchar(255) default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE resources (
	 id varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	 restype smallint NOT NULL,
	 content blob default NULL,
   version varchar(10) default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE roles (
	 id varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	 permissions blob default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE sharedtickets (
	 id varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	 content blob default NULL,
	 appuser varchar(255) default NULL,
	 pickupid smallint NOT NULL default 0 ,
	 locked varchar(20) default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE shift_breaks (
	 id varchar(255) NOT NULL,
	 shiftid varchar(255) NOT NULL,
	 breakid varchar(255) NOT NULL,
	 starttime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	 endtime timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ,
	PRIMARY KEY (id)
);

CREATE TABLE shifts (
	 id varchar(255) NOT NULL,
	 startshift timestamp NOT NULL,
	 endshift timestamp default NULL,
	 pplid varchar(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE stockcurrent (
	 location varchar(255) NOT NULL,
	 product varchar(255) NOT NULL,
	 attributesetinstance_id varchar(255) default NULL,
	 units double NOT NULL
);

CREATE TABLE stockdiary (
	 id varchar(255) NOT NULL,
	 datenew timestamp NOT NULL,
	 reason smallint NOT NULL,
	 location varchar(255) NOT NULL,
	 product varchar(255) NOT NULL,
	 attributesetinstance_id varchar(255) default NULL,
	 units double NOT NULL,
	 price double NOT NULL,
	 appuser varchar(255) default NULL,
	 supplier varchar(255) default NULL,
	 supplierdoc varchar(255) default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE stocklevel (
	 id varchar(255) NOT NULL,
	 location varchar(255) NOT NULL,
	 product varchar(255) NOT NULL,
	 stocksecurity double default NULL,
	 stockmaximum double default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE suppliers (
	 id varchar(255) NOT NULL,
	 searchkey varchar(255) NOT NULL,
	 taxid varchar(255) default NULL,
	 name varchar(255) NOT NULL,
	 maxdebt double NOT NULL default 0 ,
	 address varchar(255) default NULL,
	 address2 varchar(255) default NULL,
	 postal varchar(255) default NULL,
	 city varchar(255) default NULL,
	 region varchar(255) default NULL,
	 country varchar(255) default NULL,
	 firstname varchar(255) default NULL,
	 lastname varchar(255) default NULL,
	 email varchar(255) default NULL,
	 phone varchar(255) default NULL,
	 phone2 varchar(255) default NULL,
	 fax varchar(255) default NULL,
	 notes varchar(255) default NULL,
	 visible smallint NOT NULL default 1 ,
	 curdate timestamp default NULL,
	 curdebt double default 0 ,
	 vatid varchar(255) default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE taxcategories (
	 id varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE taxcustcategories (
	 id varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE taxes (
	 id varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	 category varchar(255) NOT NULL,
	 custcategory varchar(255) default NULL,
	 parentid varchar(255) default NULL,
	 rate double NOT NULL default 0 ,
	 ratecascade smallint NOT NULL default 0 ,
	 rateorder smallint default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE taxlines (
	 id varchar(255) NOT NULL,
	 receipt varchar(255) NOT NULL,
	 taxid varchar(255) NOT NULL,
	 base double NOT NULL default 0 ,
	 amount double NOT NULL default 0 ,
	PRIMARY KEY (id)
);

CREATE TABLE taxsuppcategories (
	 id varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE thirdparties (
	 id varchar(255) NOT NULL,
	 cif varchar(255) NOT NULL,
	 name varchar(255) NOT NULL,
	 address varchar(255) default NULL,
	 contactcomm varchar(255) default NULL,
	 contactfact varchar(255) default NULL,
	 payrule varchar(255) default NULL,
	 faxnumber varchar(255) default NULL,
	 phonenumber varchar(255) default NULL,
	 mobilenumber varchar(255) default NULL,
	 email varchar(255) default NULL,
	 webpage varchar(255) default NULL,
	 notes varchar(255) default NULL,
	PRIMARY KEY (id)
);

CREATE TABLE ticketlines (
	 ticket varchar(255) NOT NULL,
	 line smallint NOT NULL,
	 product varchar(255) default NULL,
	 attributesetinstance_id varchar(255) default NULL,
	 units double NOT NULL,
	 price double NOT NULL,
	 taxid varchar(255) NOT NULL,
	 attributes blob default NULL,
	PRIMARY KEY (ticket , line)
);

CREATE TABLE tickets (
	 id varchar(255) NOT NULL,
	 tickettype smallint NOT NULL default 0 ,
	 ticketid smallint NOT NULL,
	 person varchar(255) NOT NULL,
	 customer varchar(255) default NULL,
	 status smallint NOT NULL default 0 ,
	PRIMARY KEY (id)
);

CREATE TABLE ticketsnum (
	 id smallint NOT NULL
);

CREATE TABLE ticketsnum_payment (
	 id smallint NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE ticketsnum_refund (
	 id smallint NOT NULL
);

CREATE TABLE uom (
  id VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
 PRIMARY KEY (id)
);

CREATE TABLE vouchers (
  id VARCHAR(100) NOT NULL,
  voucher_number VARCHAR(100) DEFAULT NULL,
  customer VARCHAR(100) DEFAULT NULL,
  amount DOUBLE DEFAULT NULL,
  status CHAR(1) DEFAULT 'A' ,
 PRIMARY KEY (id)
);

-- ADD roles
INSERT INTO roles(id, name, permissions) VALUES('0', 'Administrator role', $FILE{/com/unicenta/pos/templates/Role.Administrator.xml} );
INSERT INTO roles(id, name, permissions) VALUES('1', 'Manager role', $FILE{/com/unicenta/pos/templates/Role.Manager.xml} );
INSERT INTO roles(id, name, permissions) VALUES('2', 'Employee role', $FILE{/com/unicenta/pos/templates/Role.Employee.xml} );
INSERT INTO roles(id, name, permissions) VALUES('3', 'Guest role', $FILE{/com/unicenta/pos/templates/Role.Guest.xml} );

-- ADD people
INSERT INTO people(id, name, apppassword, role, visible, image) VALUES ('0', 'Administrator', NULL, '0', 1, NULL);
INSERT INTO people(id, name, apppassword, role, visible, image) VALUES ('1', 'Manager', NULL, '1', 1, NULL);
INSERT INTO people(id, name, apppassword, role, visible, image) VALUES ('2', 'Employee', NULL, '2', 1, NULL);
INSERT INTO people(id, name, apppassword, role, visible, image) VALUES ('3', 'Guest', NULL, '3', 1, NULL);

-- ADD resources --
-- SYSTEM
INSERT INTO resources(id, name, restype, content) VALUES('00', 'Menu.Root', 0, $FILE{/com/unicenta/pos/templates/Menu.Root.txt});
INSERT INTO resources(id, name, restype, content) VALUES('02', 'Cash.Close', 0, $FILE{/com/unicenta/pos/templates/Cash.Close.xml});
INSERT INTO resources(ID, name, restype, content) VALUES('03', 'Customer.Created', 0, $FILE{/com/unicenta/pos/templates/customer.created.xml});
INSERT INTO resources(ID, name, restype, content) VALUES('04', 'Customer.Deleted', 0, $FILE{/com/unicenta/pos/templates/customer.deleted.xml});
INSERT INTO resources(ID, name, restype, content) VALUES('05', 'Customer.Updated', 0, $FILE{/com/unicenta/pos/templates/customer.updated.xml});
INSERT INTO resources(id, name, restype, content) VALUES('06', 'payment.cash', 0, $FILE{/com/unicenta/pos/templates/payment.cash.txt});
INSERT INTO resources(id, name, restype, content) VALUES('07', 'Ticket.Buttons', 0, $FILE{/com/unicenta/pos/templates/Ticket.Buttons.xml});
INSERT INTO resources(id, name, restype, content) VALUES('08', 'Ticket.Close', 0, $FILE{/com/unicenta/pos/templates/Ticket.Close.xml});
INSERT INTO resources(id, name, restype, content) VALUES('09', 'Ticket.Line', 0, $FILE{/com/unicenta/pos/templates/Ticket.Line.xml});
INSERT INTO resources(id, name, restype, content) VALUES('10', 'Window.Title', 0, $FILE{/com/unicenta/pos/templates/Window.Title.txt});

-- IMAGES
INSERT INTO resources(id, name, restype, content) VALUES('11', 'img.001', 1, $FILE{/com/unicenta/images/.01.png});
INSERT INTO resources(id, name, restype, content) VALUES('12', 'img.002', 1, $FILE{/com/unicenta/images/.02.png});
INSERT INTO resources(id, name, restype, content) VALUES('13', 'img.005', 1, $FILE{/com/unicenta/images/.05.png});
INSERT INTO resources(id, name, restype, content) VALUES('14', 'img.010', 1, $FILE{/com/unicenta/images/.10.png});
INSERT INTO resources(id, name, restype, content) VALUES('15', 'img.020', 1, $FILE{/com/unicenta/images/.20.png});
INSERT INTO resources(id, name, restype, content) VALUES('16', 'img.025', 1, $FILE{/com/unicenta/images/.25.png});
INSERT INTO resources(id, name, restype, content) VALUES('17', 'img.050', 1, $FILE{/com/unicenta/images/.50.png});
INSERT INTO resources(id, name, restype, content) VALUES('18', 'img.1', 1, $FILE{/com/unicenta/images/1.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('19', 'img.2', 1, $FILE{/com/unicenta/images/2.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('20', 'img.5', 1, $FILE{/com/unicenta/images/5.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('21', 'img.10', 1, $FILE{/com/unicenta/images/10.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('22', 'img.20', 1, $FILE{/com/unicenta/images/20.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('23', 'img.50', 1, $FILE{/com/unicenta/images/50.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('24', 'img.100', 1, $FILE{/com/unicenta/images/100.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('25', 'img.200', 1, $FILE{/com/unicenta/images/200.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('26', 'img.500', 1, $FILE{/com/unicenta/images/500.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('27', 'img.1000', 1, $FILE{/com/unicenta/images/1000.00.png});
INSERT INTO resources(id, name, restype, content) VALUES('28', 'img.cash', 1, $FILE{/com/unicenta/images/cash.png});
INSERT INTO resources(id, name, restype, content) VALUES('29', 'img.cashdrawer', 1, $FILE{/com/unicenta/images/cashdrawer.png});
INSERT INTO resources(id, name, restype, content) VALUES('30', 'img.discount', 1, $FILE{/com/unicenta/images/discount.png});
INSERT INTO resources(id, name, restype, content) VALUES('31', 'img.discount_b', 1, $FILE{/com/unicenta/images/discount_b.png});
INSERT INTO resources(id, name, restype, content) VALUES('32', 'img.heart', 1, $FILE{/com/unicenta/images/heart.png});
INSERT INTO resources(id, name, restype, content) VALUES('33', 'img.keyboard_48', 1, $FILE{/com/unicenta/images/keyboard_48.png});
INSERT INTO resources(id, name, restype, content) VALUES('34', 'img.kit_print', 1, $FILE{/com/unicenta/images/kit_print.png});
INSERT INTO resources(id, name, restype, content) VALUES('35', 'img.no_photo', 1, $FILE{/com/unicenta/images/no_photo.png});
INSERT INTO resources(id, name, restype, content) VALUES('36', 'img.refundit', 1, $FILE{/com/unicenta/images/refundit.png});
INSERT INTO resources(id, name, restype, content) VALUES('37', 'img.run_script', 1, $FILE{/com/unicenta/images/run_script.png});
INSERT INTO resources(id, name, restype, content) VALUES('38', 'img.ticket_print', 1, $FILE{/com/unicenta/images/ticket_print.png});
INSERT INTO resources(id, name, restype, content) VALUES('40', 'Printer.Ticket.Logo', 1, $FILE{/com/unicenta/images/printer.ticket.logo.jpg});

-- PRINTER
INSERT INTO resources(id, name, restype, content) VALUES('41', 'Printer.CloseCash.Preview', 0, $FILE{/com/unicenta/pos/templates/Printer.CloseCash.Preview.xml});
INSERT INTO resources(id, name, restype, content) VALUES('42', 'Printer.CloseCash', 0, $FILE{/com/unicenta/pos/templates/Printer.CloseCash.xml});
INSERT INTO resources(id, name, restype, content) VALUES('43', 'Printer.CustomerPaid', 0, $FILE{/com/unicenta/pos/templates/Printer.CustomerPaid.xml});
INSERT INTO resources(id, name, restype, content) VALUES('44', 'Printer.CustomerPaid2', 0, $FILE{/com/unicenta/pos/templates/Printer.CustomerPaid2.xml});
INSERT INTO resources(id, name, restype, content) VALUES('45', 'Printer.FiscalTicket', 0, $FILE{/com/unicenta/pos/templates/Printer.FiscalTicket.xml});
INSERT INTO resources(id, name, restype, content) VALUES('46', 'Printer.Inventory', 0, $FILE{/com/unicenta/pos/templates/Printer.Inventory.xml});
INSERT INTO resources(id, name, restype, content) VALUES('47', 'Printer.OpenDrawer', 0, $FILE{/com/unicenta/pos/templates/Printer.OpenDrawer.xml});
INSERT INTO resources(id, name, restype, content) VALUES('48', 'Printer.PartialCash', 0, $FILE{/com/unicenta/pos/templates/Printer.PartialCash.xml});
INSERT INTO resources(id, name, restype, content) VALUES('49', 'Printer.PrintLastTicket', 0, $FILE{/com/unicenta/pos/templates/Printer.PrintLastTicket.xml});
INSERT INTO resources(id, name, restype, content) VALUES('50', 'Printer.Product', 0, $FILE{/com/unicenta/pos/templates/Printer.Product.xml});
INSERT INTO resources(id, name, restype, content) VALUES('52', 'Printer.ReprintTicket', 0, $FILE{/com/unicenta/pos/templates/Printer.ReprintTicket.xml});
INSERT INTO resources(id, name, restype, content) VALUES('53', 'Printer.Start', 0, $FILE{/com/unicenta/pos/templates/Printer.Start.xml});
INSERT INTO resources(id, name, restype, content) VALUES('54', 'Printer.Ticket.P1', 0, $FILE{/com/unicenta/pos/templates/Printer.Ticket.P1.xml});
INSERT INTO resources(id, name, restype, content) VALUES('55', 'Printer.Ticket.P2', 0, $FILE{/com/unicenta/pos/templates/Printer.Ticket.P2.xml});
INSERT INTO resources(id, name, restype, content) VALUES('56', 'Printer.Ticket.P3', 0, $FILE{/com/unicenta/pos/templates/Printer.Ticket.P3.xml});
INSERT INTO resources(id, name, restype, content) VALUES('57', 'Printer.Ticket.P4', 0, $FILE{/com/unicenta/pos/templates/Printer.Ticket.P4.xml});
INSERT INTO resources(id, name, restype, content) VALUES('58', 'Printer.Ticket.P5', 0, $FILE{/com/unicenta/pos/templates/Printer.Ticket.P5.xml});
INSERT INTO resources(id, name, restype, content) VALUES('59', 'Printer.Ticket.P6', 0, $FILE{/com/unicenta/pos/templates/Printer.Ticket.P6.xml});
INSERT INTO resources(id, name, restype, content) VALUES('60', 'Printer.Ticket', 0, $FILE{/com/unicenta/pos/templates/Printer.Ticket.xml});
INSERT INTO resources(id, name, restype, content) VALUES('61', 'Printer.Ticket2', 0, $FILE{/com/unicenta/pos/templates/Printer.Ticket2.xml});
INSERT INTO resources(id, name, restype, content) VALUES('62', 'Printer.TicketClose', 0, $FILE{/com/unicenta/pos/templates/Printer.TicketClose.xml});
INSERT INTO resources(id, name, restype, content) VALUES('63', 'Printer.TicketLine', 0, $FILE{/com/unicenta/pos/templates/Printer.TicketLine.xml});
INSERT INTO resources(id, name, restype, content) VALUES('64', 'Printer.TicketNew', 0, $FILE{/com/unicenta/pos/templates/Printer.TicketLine.xml});
INSERT INTO resources(id, name, restype, content) VALUES('65', 'Printer.TicketPreview', 0, $FILE{/com/unicenta/pos/templates/Printer.TicketPreview.xml});
INSERT INTO resources(id, name, restype, content) VALUES('66', 'Printer.Ticket_A4', 0, $FILE{/com/unicenta/pos/templates/Printer.Ticket_A4.xml});
INSERT INTO resources(id, name, restype, content) VALUES('67', 'Printer.TicketPreview_A4', 0, $FILE{/com/unicenta/pos/templates/Printer.TicketPreview_A4.xml});
INSERT INTO resources(id, name, restype, content) VALUES('68', 'Printer.TicketRemote', 0, $FILE{/com/unicenta/pos/templates/Printer.TicketRemote.xml});
INSERT INTO resources(id, name, restype, content) VALUES('69', 'Printer.TicketTotal', 0, $FILE{/com/unicenta/pos/templates/Printer.TicketTotal.xml});

-- SCRIPTS
INSERT INTO resources(id, name, restype, content) VALUES('70', 'script.Keyboard', 0, $FILE{/com/unicenta/pos/templates/script.Keyboard.txt});
INSERT INTO resources(id, name, restype, content) VALUES('71', 'script.Linediscount', 0, $FILE{/com/unicenta/pos/templates/script.Linediscount.txt});
INSERT INTO resources(id, name, restype, content) VALUES('73', 'script.SendOrder', 0, $FILE{/com/unicenta/pos/templates/script.SendOrder.txt});
INSERT INTO resources(id, name, restype, content) VALUES('74', 'script.Totaldiscount', 0, $FILE{/com/unicenta/pos/templates/script.Totaldiscount.txt});
INSERT INTO resources(id, name, restype, content) VALUES('75', 'script.multibuy', 0, $FILE{/com/unicenta/pos/templates/script.multibuy.txt});

-- ADD CATEGORIES
INSERT INTO categories(id, name) VALUES ('000', 'Category Standard');

-- ADD TAXCATEGORIES
/* 002 added 31/01/2017 00:00:00. */
INSERT INTO taxcategories(id, name) VALUES ('000', 'Tax Exempt');
INSERT INTO taxcategories(id, name) VALUES ('001', 'Tax Standard');
INSERT INTO taxcategories(id, name) VALUES ('002', 'Tax Other');

-- ADD TAXES
/* 002 added 31/01/2017 00:00:00. */
INSERT INTO taxes(id, name, category, custcategory, parentid, rate, ratecascade, rateorder) VALUES ('000', 'Tax Exempt', '000', NULL, NULL, 0, 0, NULL);
INSERT INTO taxes(id, name, category, custcategory, parentid, rate, ratecascade, rateorder) VALUES ('001', 'Tax Standard', '001', NULL, NULL, 0.20, 0, NULL);
INSERT INTO taxes(id, name, category, custcategory, parentid, rate, ratecascade, rateorder) VALUES ('002', 'Tax Other', '002', NULL, NULL, 0, 0, NULL);

-- ADD PRODUCTS
INSERT INTO products(id, reference, code, name, category, taxcat, isservice, display, printto)
VALUES ('xxx999_999xxx_x9x9x9', 'xxx999', 'xxx999', 'Free Line entry', '000', '001', 1, '<html><center>Free Line entry', '1');
INSERT INTO products(id, reference, code, name, category, taxcat, isservice, display, printto)
VALUES ('xxx998_998xxx_x8x8x8', 'xxx998', 'xxx998', 'Service Charge', '000', '001', 1, '<html><center>Service Charge', '1');

-- ADD PRODUCTS_CAT
INSERT INTO products_cat(product) VALUES ('xxx999_999xxx_x9x9x9');
INSERT INTO products_cat(product) VALUES ('xxx998_998xxx_x8x8x8');

-- ADD LOCATION
INSERT INTO locations(id, name, address) VALUES ('0','Location 1','Local');

-- ADD SUPPLIERS
INSERT INTO suppliers(id, searchkey, name) VALUES ('0','unicenta','unicenta');

-- ADD UOM
INSERT INTO uom(id, name) VALUES ('0','Each');

-- ADD FLOORS
INSERT INTO floors(id, name, image) VALUES ('0', 'Restaurant floor', $FILE{/com/unicenta/images/paperboard960_600.png});

-- ADD PLACES
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('1', 'Table 1', 100, 50, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('2', 'Table 2', 250, 50, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('3', 'Table 3', 400, 50, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('4', 'Table 4', 550, 50, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('5', 'Table 5', 700, 50, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('6', 'Table 6', 850, 50, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('7', 'Table 7', 100, 150, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('8', 'Table 8', 250, 150, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('9', 'Table 9', 400, 150, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('10', 'Table 10', 550, 150, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('11', 'Table 11', 700, 150, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('12', 'Table 12', 850, 150, '0', '1', 90, 45);

INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('13', 'Table 13', 100, 250, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('14', 'Table 14', 250, 250, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('15', 'Table 15', 400, 250, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('16', 'Table 16', 550, 250, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('17', 'Table 17', 700, 250, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('18', 'Table 18', 850, 250, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('19', 'Table 19', 100, 350, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('20', 'Table 20', 250, 350, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('21', 'Table 21', 400, 350, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('22', 'Table 22', 550, 350, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('23', 'Table 23', 700, 350, '0', '1', 90, 45);
INSERT INTO places(id, name, x, y, floor, seats, width, height) VALUES ('24', 'Table 24', 850, 350, '0', '1', 90, 45);

-- ADD SHIFTS
INSERT INTO shifts(id, startshift, endshift, pplid) VALUES ('0', '2018-01-01 00:00:00.001', '2018-01-01 00:00:00.002','0');

-- ADD BREAKS
INSERT INTO breaks(id, name, visible, notes) VALUES ('0', 'Lunch Break', 1, NULL);
INSERT INTO breaks(id, name, visible, notes) VALUES ('1', 'Tea Break', 1, NULL);
INSERT INTO breaks(id, name, visible, notes) VALUES ('2', 'Mid Break', 1, NULL);

-- ADD SHIFT_BREAKS
INSERT INTO shift_breaks(id, shiftid, breakid, starttime, endtime) VALUES ('0', '0', '0', '2018-01-01 00:00:00.003', '2018-01-01 00:00:00.004');

-- ADD SEQUENCES
INSERT INTO pickup_number VALUES(1);
INSERT INTO ticketsnum VALUES(1);
INSERT INTO ticketsnum_refund VALUES(1);
INSERT INTO ticketsnum_payment VALUES(1);

-- ADD APPLICATION VERSION
INSERT INTO applications(id, name, version) VALUES($APP_ID{}, $APP_NAME{}, $APP_VERSION{});
