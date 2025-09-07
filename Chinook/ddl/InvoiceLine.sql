CREATE TABLE `InvoiceLine`
(
    `InvoiceLineId` INT NOT NULL AUTO_INCREMENT,
    `InvoiceId` INT NOT NULL,
    `TrackId` INT NOT NULL,
    `UnitPrice` NUMERIC(10,2) NOT NULL,
    `Quantity` INT NOT NULL,
    CONSTRAINT `PK_InvoiceLine` PRIMARY KEY  (`InvoiceLineId`)
);

CREATE INDEX `IFK_InvoiceLineInvoiceId` ON `InvoiceLine` (`InvoiceId`);

ALTER TABLE `InvoiceLine` ADD CONSTRAINT `FK_InvoiceLineTrackId`
    FOREIGN KEY (`TrackId`) REFERENCES `Track` (`TrackId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_InvoiceLineTrackId` ON `InvoiceLine` (`TrackId`);
