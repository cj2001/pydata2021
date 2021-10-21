//CREATE CONSTRAINT tweets IF NOT EXISTS ON (t:Tweet) ASSERT t.text IS UNIQUE;
CREATE CONSTRAINT people IF NOT EXISTS ON (p:Person) ASSERT p.name IS UNIQUE;
CREATE CONSTRAINT hashtags IF NOT EXISTS ON (h:Hashtag) ASSERT h.tag IS UNIQUE;

// Bring in authored relationships
:auto USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/cj2001/pydata2021/main/notebooks/data/tweets_with_ents.csv' AS line
WITH line
WHERE
    line.clean IS NOT NULL
MERGE (a:Person {name: line.login})
MERGE (t:Tweet {text: line.clean, target: line.target})
WITH a, t, line
CALL apoc.create.relationship(a, 'AUTHORED', {}, t) YIELD rel
RETURN a, t



// Bring in hashtag relationships
:auto USING PERIODIC COMMIT 1000
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/cj2001/pydata2021/main/notebooks/data/tweets_with_ents.csv' AS line
WITH line
MERGE (t:Tweet {text: line.clean})
MERGE (h:Hashtag {tag: line.hashtag})
WITH t, h, line
CALL apoc.create.relationship(t, 'HAS_TAG', {}, t) YIELD rel
RETURN t, h