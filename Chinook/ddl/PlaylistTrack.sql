CREATE TABLE `PlaylistTrack`
(
    `PlaylistId` INT NOT NULL,
    `TrackId` INT NOT NULL,
    CONSTRAINT `PK_PlaylistTrack` PRIMARY KEY  (`PlaylistId`, `TrackId`)
);
