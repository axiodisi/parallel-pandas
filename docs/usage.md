# ParallelPandas Usage Guide

## Introduction

ParallelPandas is a data manipulation library for the Bend programming language, optimized for parallel processing. This guide provides detailed instructions on how to use the library.

## Table of Contents

- [Creating a DataFrame](#creating-a-dataframe)
- [Filtering Data](filtering.md)
- [Selecting Columns](#selecting-columns)
- [Aggregating Data](aggregating.md)
- [Reading and Writing CSV Files](reading_writing_csv.md)

## Creating a DataFrame

To create a DataFrame, use the `create_dataframe` function with a list of Series and column names.

```bend
import "parallel_pandas.bend"

# Create a Series for each column
let names = create_series(["Alice", "Bob", "Charlie"], [0, 1, 2])
let ages = create_series([25, 32, 37], [0, 1, 2])
let cities = create_series(["New York", "Los Angeles", "Chicago"], [0, 1, 2])

# Combine the Series into a DataFrame
let columns = ["Name", "Age", "City"]
let df = create_dataframe([names, ages, cities], columns)
