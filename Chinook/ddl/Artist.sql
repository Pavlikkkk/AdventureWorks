CREATE TABLE `Artist`
(
    `ArtistId` INT NOT NULL AUTO_INCREMENT,
    `Name` NVARCHAR(120),
    CONSTRAINT `PK_Artist` PRIMARY KEY  (`ArtistId`)
);

-- description: The table Artist contains artists' names. The other tables might reference this table 
