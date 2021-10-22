// Load constraints
CREATE CONSTRAINT people IF NOT EXISTS ON (p:Person) ASSERT p.name IS UNIQUE;
CREATE CONSTRAINT occ IF NOT EXISTS ON (o:Occupation) ASSERT o.type IS UNIQUE;

// Load in people, occupations
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/cj2001/pydata2021/main/notebooks/data/famous_people.csv' AS line 
WITH line 
WHERE line.summary IS NOT NULL 
MERGE (p:Person {name: line.itemLabel, summary: line.summary}) 
MERGE (o:Occupation {type: line.new_occ})



// Create occupation relationship
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/cj2001/pydata2021/main/notebooks/data/famous_people.csv' AS line 
WITH line 
WHERE line.summary IS NOT NULL 
MATCH (p:Person {name: line.itemLabel}) MATCH (o:Occupation {type: line.new_occ}) 
MERGE (p)-[:HAS_OCCUPATION]->(o)

// Set node properties
MATCH (p:Person)-->(o:Occupation)
WHERE o.type = "baseball player"
SET p.is_politican = 0
RETURN p.name, p.is_politican, o.type

MATCH (p:Person)-->(o:Occupation)
WHERE o.type = "actor"
SET p.is_politican = 0
RETURN p.name, p.is_politican, o.type

MATCH (p:Person)-->(o:Occupation)
WHERE o.type = "politician"
SET p.is_politican = 1
RETURN p.name, p.is_politican, o.type