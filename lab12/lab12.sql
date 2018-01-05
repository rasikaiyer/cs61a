.read sp17data.sql
.read fa17data.sql

CREATE TABLE obedience AS
  SELECT seven, denero, hilfinger FROM students;

CREATE TABLE smallest_int AS
  SELECT time, smallest FROM students WHERE smallest > 18 ORDER BY smallest LIMIT 20;

CREATE TABLE greatstudents AS
  SELECT a.date, a.color,a.pet,a.number,b.number FROM students as a, sp17students as b WHERE a.date = b.date AND a.color = b.color AND a.pet = b.pet;

CREATE TABLE sevens AS
  SELECT a.seven FROM students as s, checkboxes as b WHERE a.number = 7 and b.'7' =True;

CREATE TABLE matchmaker AS
  SELECT a.pet, a.song, a.color, b.color FROM students as a, students as b WHERE a.time < b.time and a.pet = b.pet and a.song = b.song;