// Create constraints
CREATE CONSTRAINT papers IF NOT EXISTS ON (p:Paper) ASSERT p.id IS UNIQUE;

// Load node list
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/cj2001/pydata2021/oct23/notebooks/data/cora_nodes.csv' AS line
WITH line
MERGE (p:Paper {id: line.id, subject: line.subject, features: line.features})
RETURN COUNT(*)

// Load edge list
LOAD CSV WITH HEADERS FROM 'https://raw.githubusercontent.com/cj2001/pydata2021/oct23/notebooks/data/cora_edges.csv' AS line
WITH line
MATCH (source:Paper {id: line.source})
MATCH (target:Paper {id: line.target})
MERGE (source)-[:CITES]->(target)
RETURN COUNT(*)

// Create in-memory graph of (Paper)-[:CITES]-(Paper)
CALL gds.graph.create(
    'cora',
    'Paper',
    {CITES: 
        {
            orientation: 'UNDIRECTED'
        }
    }
)

// Stream FastRP embeddings
CALL gds.fastRP.stream('cora',
 {
     embeddingDimension: 10
    }
)
YIELD nodeId, embedding
RETURN gds.util.asNode(nodeId).id AS id, embedding
LIMIT 10

