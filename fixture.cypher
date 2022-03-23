LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/mathbeveridge/asoiaf/master/data/asoiaf-all-edges.csv" AS row
MERGE (src:Character {name: row.Source})
MERGE (tgt:Character {name: row.Target})
MERGE (src)-[r:INTERACTS]->(tgt) ON CREATE SET r.weight = toInteger(row.weight);

LOAD CSV WITH HEADERS FROM "https://raw.githubusercontent.com/johnymontana/neovis.js/master/examples/data/got-centralities.csv" AS row
MATCH (c:Character {name: row.name})
SET c.community = toInteger(row.community),
    c.pagerank  = toFloat(row.pagerank);
