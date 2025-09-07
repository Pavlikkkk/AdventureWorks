CREATE TABLE `Invoice`
(
    `InvoiceId` INT NOT NULL AUTO_INCREMENT,
    `CustomerId` INT NOT NULL,
    `InvoiceDate` DATETIME NOT NULL,
    `BillingAddress` NVARCHAR(70),
    `BillingCity` NVARCHAR(40),
    `BillingState` NVARCHAR(40),
    `BillingCountry` NVARCHAR(40),
    `BillingPostalCode` NVARCHAR(10),
    `Total` NUMERIC(10,2) NOT NULL,
    CONSTRAINT `PK_Invoice` PRIMARY KEY  (`InvoiceId`)
);

ALTER TABLE `Invoice` ADD CONSTRAINT `FK_InvoiceCustomerId`
    FOREIGN KEY (`CustomerId`) REFERENCES `Customer` (`CustomerId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_InvoiceCustomerId` ON `Invoice` (`CustomerId`);
