CREATE TABLE parents AS
  SELECT "abraham" AS parent, "barack" AS child UNION
  SELECT "abraham"          , "clinton"         UNION
  SELECT "delano"           , "herbert"         UNION
  SELECT "fillmore"         , "abraham"         UNION
  SELECT "fillmore"         , "delano"          UNION
  SELECT "fillmore"         , "grover"          UNION
  SELECT "eisenhower"       , "fillmore";

CREATE TABLE dogs AS
  SELECT "abraham" AS name, "long" AS fur, 26 AS height UNION
  SELECT "barack"         , "short"      , 52           UNION
  SELECT "clinton"        , "long"       , 47           UNION
  SELECT "delano"         , "long"       , 46           UNION
  SELECT "eisenhower"     , "short"      , 35           UNION
  SELECT "fillmore"       , "curly"      , 32           UNION
  SELECT "grover"         , "short"      , 28           UNION
  SELECT "herbert"        , "curly"      , 31;

CREATE TABLE sizes AS
  SELECT "toy" AS size, 24 AS min, 28 AS max UNION
  SELECT "mini"       , 28       , 35        UNION
  SELECT "medium"     , 35       , 45        UNION
  SELECT "standard"   , 45       , 60;

-------------------------------------------------------------
-- PLEASE DO NOT CHANGE ANY SQL STATEMENTS ABOVE THIS LINE --
-------------------------------------------------------------

-- The size of each dog
CREATE TABLE size_of_dogs AS
  SELECT name, size FROM dogs, sizes WHERE min < height AND height <= max;

-- All dogs with parents ordered by decreasing height of their parent
CREATE TABLE by_height AS
  SELECT child FROM parents, dogs WHERE parent = name ORDER BY -height;

-- Sentences about siblings that are the same size
CREATE TABLE sentences AS
  WITH siblings(first, second) AS (
      SELECT a.child, b.child FROM parents AS a, parents AS b
        WHERE a.parent = b.parent AND a.child < b.child)
  SELECT first || ' and ' || second || ' are ' || a.size || ' siblings'
    FROM siblings, size_of_dogs AS a, size_of_dogs AS b WHERE a.size = b.size AND a.name = first AND b.name = second;

-- Ways to stack 4 dogs to a height of at least 170, ordered by total height
CREATE TABLE stacks AS
  WITH stack_recur(dogs, total, n, max) AS (
      SELECT name, height, 1, height FROM dogs UNION
  SELECT dogs || ', ' || name, total+height, n+1, height
    FROM stack_recur, dogs WHERE n < 4 AND max < height
    )
  SELECT dogs, total FROM stack_recur WHERE total >= 170 AND n = 4 ORDER BY total;
