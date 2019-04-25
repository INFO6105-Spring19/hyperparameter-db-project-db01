show databases;
use dmddproject;
create table Dataset ( DatasetID INT Primary key, DatasetName Varchar(100), TypeOfDataset Varchar(100), NumberOfColumns INT, NumberOfRecords INT);
insert into Dataset (DatasetID,DatasetName,TypeOfDataset,NumberOfColumns,NumberOfRecords) values(1,'Diabetes_train','csv',50,50001);
alter table datadescription add constraint Primary key (ID) ;
alter table datadescription add constraint Foreign key (DatasetID) references Dataset(DatasetID);	
select * from Metadatatable;
alter table Metadatatable add constraint Primary key (Runtime_ID) ;
alter table Metadatatable add constraint Foreign key (DatasetID) references Dataset(DatasetID);	
select * from modeltable;
alter table modeltable add constraint primary key (Model_ID); 
alter table modeltable add constraint foreign key (Runtime_ID) references Metadatatable(Runtime_ID);
select * from HPtable;
alter table HPtable add constraint primary key (HP_ID); 
alter table HPtable add constraint foreign key (Model_ID) references modeltable(Model_ID);
select * from metrictable;
alter table metrictable add constraint primary key (Metric_ID); 
alter table metrictable add constraint foreign key (HP_ID) references HPtable(HP_ID);

