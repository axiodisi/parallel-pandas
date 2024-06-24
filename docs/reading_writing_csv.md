
**docs/reading_writing_csv.md**:
```markdown
# Reading and Writing CSV Files

Read data from a CSV file into a DataFrame using the `read_csv` function.

## Reading CSV

```bend
import "parallel_pandas.bend"

# Read data from a CSV file
let df = read_csv("data.csv")

# Print the DataFrame
df.data.forEach(series -> {
    print(series.data.join(", "))
})
