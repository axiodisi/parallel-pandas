
**docs/filtering.md**:
```markdown
# Filtering Data

You can filter rows in a DataFrame based on a condition using the `filter_dataframe` function.

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

# Define a condition to filter rows where Age is greater than 30
let condition = (series: Series[Any]) -> Bool {
    series.data > 30
}

# Apply the filter to the DataFrame
let filtered_df = filter_dataframe(df, condition)

# Print the filtered DataFrame
filtered_df.data.forEach(series -> {
    print(series.data.join(", "))
})
