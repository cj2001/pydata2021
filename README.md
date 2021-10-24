# Working with Data in a Connected World: the Power of Graph Data Science
## A PyData Global 2021 Tutorial
### Written by Dr. Clair J. Sullivan, Data Science Advocate, Neo4j
#### email: clair.sullivan@neo4j.com
#### Twitter: @CJLovesData1
#### Last updated: 2021-10-24

## Introduction

Data science and machine learning have traditionally revolved around creating models based on the assumption that individual data points are uncorrelated. However, this ignores a signal that could potentially be very strong: the relationships between data points. We will look at this data as a network graph, and explore how to unlock the potential using a graph database.

We will cover the following in this tutorial:

- An introduction to graphs and graph theory
- How working with a graph differs from columnar data, such as is available via SQL or Pandas dataframes
- A brief exploration of basic Python packages that can be used to interact with graphs
- Creation of a free Sandbox graph database
- A crash course in the Cypher query language
- Creation of a basic graph of the [CORA database](https://relational.fit.cvut.cz/dataset/CORA)
- Generation of graph embeddings
- Evaluation and comparison of machine learning models based on word embeddings versus graph embeddings

_This tutorial assumes no previous knowledge._  