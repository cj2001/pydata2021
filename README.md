# Working with Data in a Connected World: the Power of Graph Data Science
### A PyData Global 2021 Tutorial
### Written by Dr. Clair J. Sullivan, Data Science Advocate, Neo4j
#### email: clair.sullivan@neo4j.com
#### Twitter: @CJLovesData1
#### Last updated: 2021-10-27

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

### Some helfpul resources

- ["Graph Algorithm Examples in Apache Spark and Neo4j" (free book)](https://dev.neo4j.com/graph_algorithms_book)
- [Create a Neo4j Sandbox](https://sandbox.neo4j.com/)
- [Google Colab](https://colab.research.google.com/notebooks/welcome.ipynb)
- [The Neo4j Cheat Sheet and Quick Reference](https://dev.neo4j.com/neo4j_cheatsheet)
- [Cypher Manual](https://neo4j.com/docs/cypher-manual/current/)
- [Neo4j Cypher Reference Card](https://neo4j.com/docs/cypher-refcard/current/)
- [Advanced Cypher Query Tuning (video)](https://youtu.be/xPSKqm4hFRc)
- [Graph Data Science Library API Docs](https://dev.neo4j.com/graph_data_science)
- [Bite-Sized Neo4j for Data Scientists (video series)](https://neo4j.com/video/bite-sized-neo4j-for-data-scientists/)
- [My Medium Articles](https://medium.com/@cj2001)


#### If you find any errors in this tutorial, please let us know by creating an issue in this repo!