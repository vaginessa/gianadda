CREATE TABLE folders (
    ID INT NOT NULL IDENTITY,
    PARENT_ID INT,
    NAME VARCHAR(256) NOT NULL,
    TITLE VARCHAR(256) NOT NULL,
    DESCRIPTION TEXT,

    FOREIGN KEY (PARENT_ID) REFERENCES folders(ID)
);

CREATE UNIQUE INDEX folders_parent_name ON folders(PARENT_ID,NAME);

CREATE TABLE pictures (
    ID INT NOT NULL IDENTITY,
    FOLDER_ID INT NOT NULL,
    NAME VARCHAR(256) NOT NULL,
    DATETIME TIMESTAMP NOT NULL,
    WIDTH INT NOT NULL,
    HEIGHT INT NOT NULL,
    LATITUDE DOUBLE,
    LONGITUDE DOUBLE,
    ALTITUDE DOUBLE,
    DESCRIPTION TEXT,
    ARTIST VARCHAR(128),
    COPYRIGHT VARCHAR(256),

    FOREIGN KEY (FOLDER_ID) REFERENCES folders(ID)
);

CREATE UNIQUE INDEX pictures_folder_name ON pictures(FOLDER_ID,NAME);

CREATE TABLE tracks(
    ID INT NOT NULL IDENTITY,
    FOLDER_ID INT NOT NULL,
    NAME VARCHAR(256) NOT NULL,
    DATETIME TIMESTAMP NOT NULL,
    SOUTH DOUBLE NOT NULL,
    WEST DOUBLE NOT NULL,
    NORTH DOUBLE NOT NULL,
    EAST DOUBLE NOT NULL,
    GPX TEXT NOT NULL,

    FOREIGN KEY (FOLDER_ID) REFERENCES folders(ID)
);

CREATE UNIQUE INDEX tracks_folder_name ON tracks(FOLDER_ID,NAME);
