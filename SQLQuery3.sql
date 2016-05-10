use DB
create table  Genres
 (
 ID int identity(1,1) primary key,
 Name varchar(20) not null
 )

 create table  Supported_languages
 (
 ID int identity(1,1) primary key,
 Name varchar(20) not null
 )

 create table  Request_states
 (
 ID int identity(1,1) primary key,
 Request_state varchar(20) not null
 )

 create table  Request
 (
 ID int identity(1,1) primary key,
 Name varchar(20) not null,
 Language_ varchar(20) not null,
 Date_ date not null
 )

 create table  Idioms
 (
 ID int identity(1,1) primary key,
 Text_of_idiom_on_english varchar(20) not null,
 Text_of_idiom_on_ukrainian varchar(20) not null,
 Song_id int not null
 )

 create table  Songs
 (
 ID int identity(1,1) primary key,
 Album_id int not null,
 Name varchar(20) not null,
 Text_ varchar not null,
 Translation_id int not null
 )

 create table  Albums
 (
 ID int identity(1,1) primary key,
 Singer_id int not null,
 Name varchar(20) not null,
 Year_ int not null,
 Studio varchar(50) not null
 )

 create table  Singers
 (
 ID int identity(1,1) primary key,
 Stage_name varchar(20),
 Real_name varchar(20) not null,
 Country varchar(20) not null,
 Official_site varchar(50),
 Genres_id int not null,
 Page_on_wikipedia varchar(100) 
 )

 create table  Translations
 (
 ID int identity(1,1) primary key,
 Language_id int not null,
 Text_ varchar not null,
 Original_text varchar not null,
 Author_id int not null
 )

 create table  Authors
 (
 ID int identity(1,1) primary key,
 Nickname varchar(20) not null,
 Name varchar(20) not null
 )