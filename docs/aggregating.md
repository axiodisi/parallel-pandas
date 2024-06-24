
**docs/aggregating.md**:
```markdown
# Aggregating Data

Aggregate data in a DataFrame using the `aggregate_dataframe` function.

## Example

```bend
import "parallel_pandas.bend"

# Create a DataFrame
let data = [
    create_series(["Alice", "Bob", "Charlie"], [0, 1, 2]),
    create_series([25, 32, 37], [0, 1, 2]),
    create_series(["New York", "Los Angeles", "Chicago"], [0, 1, 2])
]
let columns = ["Name", "Age", "City"]
let df = create_dataframe(data, columns)

# Define a function to sum the values in a column
let sum_func = (data: List[Any]) -> Any {
    data.fold(0, (acc, x) -> acc + x)
}

# Apply the aggregation function to the DataFrame
let aggregated_df = aggregate_dataframe(df, sum_func)

# Print the aggregated DataFrame
aggregated_df.data.forEach(series -> {
    print(series.data.join(", "))
})
