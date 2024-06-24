
**docs/selecting_columns.md**:
```markdown
# Selecting Columns

Select specific columns from a DataFrame using the `select_columns` function.

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

# Select only the "Name" and "City" columns
let selected_df = select_columns(df, ["Name", "City"])

# Print the selected DataFrame
selected_df.data.forEach(series -> {
    print(series.data.join(", "))
})
