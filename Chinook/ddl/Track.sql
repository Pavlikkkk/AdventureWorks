CREATE TABLE `Track`
(
    `TrackId` INT NOT NULL AUTO_INCREMENT,
    `Name` NVARCHAR(200) NOT NULL,
    `AlbumId` INT,
    `MediaTypeId` INT NOT NULL,
    `GenreId` INT,
    `Composer` NVARCHAR(220),
    `Milliseconds` INT NOT NULL,
    `Bytes` INT,
    `UnitPrice` NUMERIC(10,2) NOT NULL,
    CONSTRAINT `PK_Track` PRIMARY KEY  (`TrackId`)
);

CREATE INDEX `IFK_TrackAlbumId` ON `Track` (`AlbumId`);

ALTER TABLE `Track` ADD CONSTRAINT `FK_TrackGenreId`
    FOREIGN KEY (`GenreId`) REFERENCES `Genre` (`GenreId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_TrackGenreId` ON `Track` (`GenreId`);

ALTER TABLE `Track` ADD CONSTRAINT `FK_TrackMediaTypeId`
    FOREIGN KEY (`MediaTypeId`) REFERENCES `MediaType` (`MediaTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_TrackMediaTypeId` ON `Track` (`MediaTypeId`);
