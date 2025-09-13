CREATE TABLE `Album`
(
    `AlbumId` INT NOT NULL AUTO_INCREMENT,
    `Title` NVARCHAR(160) NOT NULL,
    `ArtistId` INT NOT NULL,
    CONSTRAINT `PK_Album` PRIMARY KEY  (`AlbumId`)
);

ALTER TABLE `Album` ADD CONSTRAINT `FK_AlbumArtistId`
    FOREIGN KEY (`ArtistId`) REFERENCES `Artist` (`ArtistId`) ON DELETE NO ACTION ON UPDATE NO ACTION;

CREATE INDEX `IFK_AlbumArtistId` ON `Album` (`ArtistId`);

-- description: The table Album contains info about artists and their titles. Other tables reference that table based on ArtistId column
