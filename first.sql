create table if not exists albums (
id_album serial primary key,
album_name VARCHAR(60) not null unique,
graduated_year INTEGER
);
create table if not exists collections (
id_collection serial primary key,
collection_name VARCHAR(60) not null unique,
graduate_year INTEGER
);
create table if not exists tracks (
id_track serial primary key,
id_album integer references albums(id_album),
track_name VARCHAR(60) not null unique,
duration INTERVAL
);
create table if not exists music_genre (
id_genre serial primary key,
genre_name VARCHAR(60) not null unique
);
create table if not exists executors (
id_executor serial primary key,
executor_name VARCHAR(60) not null unique
);
create table if not exists track_collection (
id_collection INTEGER references collections(id_collection),
id_track INTEGER references tracks(id_track),
constraint pk primary key (id_collection, id_track)
);
create table if not exists genre_executor (
id_genre INTEGER references music_genre(id_genre),
id_executor INTEGER references executors(id_executor),
constraint pk primary key (id_genre, id_executor)
);
create table if not exists executor_album (
id_album INTEGER references albums(id_album),
id_executor INTEGER references executors(id_executor),
constraint pk primary key (id_album, id_executor)
);