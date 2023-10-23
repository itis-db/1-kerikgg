insert into activitytype(
	activitytypeid,
    name,
    sysname
)
select d.*
from (
	values(1,'Программа','Program')
    ,(2,'Подпрограмма','SubProgram')
    ,(3,'Проект','Project')
    ,(4,'Контракт','Contract')
    ,(5,'КТ','Point')
) as d(activitytypeid, name, sysname)
where not exists(
	select 1 from activitytype as t
    where t.activitytypeid = d.activitytypeid
);

insert into area 
values(1,'Евразия'),
       (2,'Африка'),
       (3,'Австралия'),
       (4,'Антарктида'),
       (5,'Северная Америка'),
       (6,'Южная Америка')
on conflict (areaid) do nothing;

insert into activity 
values (1, 1, '1', 'Программа A', null),
           (2, 1, '2', 'Программа B', null),
           (3, 1, '3', 'Программа C', null),
           (4, 2, '1.1', 'Подпрограмма A-1', 1),
           (5, 2, '2.1', 'Подпрограмма B-1', 2),
           (6, 2, '3.1', 'Подпрограмма C-1', 3),
           (7, 2, '3.2', 'Подпрограмма C-2', 3),
           (8, 3, '1.1.1', 'Проект A-1-1', 4),
           (9, 3, '2.1.1', 'Проект B-1-1', 5),
           (10,3, '3.1.1', 'Проект C-1-1', 6),
           (11, 3, '3.2.1', 'Проект C-2-1', 7),
           (12, 4, '1.1.1.1', 'Контракт A-1-1-1', 8),
           (13, 4, '2.1.1.1', 'Контракт B-1-1-1', 9),
           (14, 4, '3.1.1.1', 'Контракт C-1-1-1', 10),
           (15, 4, '3.2.1.1', 'Контракт C-2-1-1', 11),
           (16, 4, '3.2.1.2', 'Контракт C-2-1-2', 11),
           (17, 5, 'P1.1.1', 'КТ A-1-1', 8),
           (18, 5, 'P2.1.1', 'КТ B-1-1', 9),
           (19, 5, 'P3.1.1', 'КТ C-1-1', 10),
           (20, 5, 'P3.2.1', 'КТ C-2-1', 11),
           (21, 5, 'P1.1.1.1', 'КТ A-1-1-1', 12),
           (22, 5, 'P2.1.1.1', 'КТ B-1-1-1', 13),
           (23, 5, 'P3.1.1.1', 'КТ C-1-1-1', 14),
           (24, 5, 'P3.2.1.1', 'КТ C-2-1-1', 15),
           (25, 5, 'P3.2.1.2', 'КТ C-2-1-2', 16)
on conflict do nothing;

insert into program 
values(1, null, 2014, 2019),
          (2, 2, 2015, 2023),
          (3, 3, 2022, null)
on conflict (programid) do nothing;

insert into subprogram 
values(4, null),
          (5, 7),
          (6, null),
          (7, 19)
on conflict (subprogramid) do nothing;

insert into project
values(8, 'FirstProject'),
          (9, 'SecondProject'),
          (10, 'ThirdProject'),
          (11, null)
on conflict (projectid) do nothing;

insert into contract 
values	(12, 1),
          (13, 1),
          (14, 4),
          (15, 5),
          (16, 6)
on conflict (contractid) do nothing;

insert into point
values(17, to_date('01-07-2017', 'DD-MM-YYYY'), to_date('01-07-2018', 'DD-MM-YYYY')),
          (18, to_date('01-08-2018', 'DD-MM-YYYY'), to_date('01-08-2019', 'DD-MM-YYYY')),
          (19, to_date('01-09-2019', 'DD-MM-YYYY'), to_date('01-09-2020', 'DD-MM-YYYY')),
          (20, to_date('20-02-2020', 'DD-MM-YYYY'), to_date('20-02-2021', 'DD-MM-YYYY')),
          (21, to_date('21-02-2021', 'DD-MM-YYYY'), to_date('21-02-2022', 'DD-MM-YYYY')),
          (22, to_date('22-02-2022', 'DD-MM-YYYY'), to_date('22-02-2023', 'DD-MM-YYYY')),
          (23, to_date('23-02-2023', 'DD-MM-YYYY'), to_date('23-02-2024', 'DD-MM-YYYY')),
          (24, to_date('24-02-2024', 'DD-MM-YYYY'), to_date('24-02-2025', 'DD-MM-YYYY')),
          (25, to_date('25-02-2025', 'DD-MM-YYYY'), to_date('25-02-2026', 'DD-MM-YYYY'))
on conflict (pointid) do nothing;