create table if not exists activitytype (
	activitytypeid integer primary key unique,
	name text not null,
	sysname text not null
);

create table if not exists activity (
	activityid integer primary key unique,
	activitytypeid integer not null,
	code text not null,
	name text not null,
	parentid integer,
	foreign key (activitytypeid) references activitytype(activitytypeid) on delete cascade,
	foreign key (parentid) references activity(activityid) on delete cascade
);

create table if not exists program (
	programid integer primary key unique,
	indexnum integer null,
	yearstart integer null,
	yearfinish integer null,
	foreign key (programid) references activity(activityid) on delete cascade
);

create table if not exists subprogram (
	subprogramid integer primary key unique,
	indexnum integer null,
	foreign key (subprogramid) references activity(activityid) on delete cascade
);

create table if not exists project (
	projectid integer primary key unique,
	targetdescr text,
	foreign key (projectid) references activity(activityid) on delete cascade
);

create table if not exists area (
	areaid integer primary key unique,
	name text not null
);

create table if not exists contract (
	contractid integer primary key unique,
	areaid integer,
	foreign key (contractid) references activity(activityid) on delete cascade,
	foreign key (areaid) references area(areaid) on delete set null
);

create table if not exists point (
	pointid integer primary key unique,
	plandate date not null,
	factdate date,
	foreign key (pointid) references activity(activityid) on delete cascade
);
