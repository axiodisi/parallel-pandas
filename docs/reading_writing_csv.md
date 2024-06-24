
**docs/reading_writing_csv.md**:
```markdown
# Reading and Writing CSV Files

Read data from a CSV file into a DataFrame using the `read_csv` function.
```
## Reading CSV

```bend
import "parallel_pandas.bend"

# Read data from a CSV file
let df = read_csv("data.csv")

# Print the DataFrame
df.data.forEach(series -> {
    print(series.data.join(", "))
})

```
## Writing CSV

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

# Write the DataFrame to a CSV file
write_csv(df, "output.csv")
