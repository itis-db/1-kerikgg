---
WITH RECURSIVE hierarchy (activityid, parentid, "path", i, activitytypeid) AS
(
    SELECT t1.activityid,
           t1.parentid,
           CAST(t1.name AS text),
           1 AS i,
           t1.activitytypeid
    FROM activity AS t1
    WHERE activitytypeid = 4
    UNION ALL
    SELECT t2.activityid,
           t2.parentid,
           t2.name || '->' || h."path",
           h.i + 1 AS i,
           t2.activitytypeid 
    FROM activity t2
    JOIN hierarchy AS h ON (t2.activityid = h.parentid)
)
SELECT "path"
FROM hierarchy
WHERE i = 4
ORDER BY "path";
