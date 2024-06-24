# example1.bend

import "parallel_pandas.bend"

# Create a DataFrame
let data = [
    create_series(["Alice", "Bob", "Charlie"], [0, 1, 2]),
    create_series([25, 32, 37], [0, 1, 2]),
    create_series(["New York", "Los Angeles", "Chicago"], [0, 1, 2])
]
let columns = ["Name", "Age", "City"]
let df = create_dataframe(data, columns)

# Filter rows where Age is greater than 30
let condition = (series: Series[Any]) -> Bool {
    series.data[1] > 30
}
let filtered_df = filter_dataframe(df, condition)

# Print the filtered DataFrame
filtered_df.data.forEach(series -> {
    print(series.data.join(", "))
})

# Aggregate the Age column
let sum_func = (data: List[Any]) -> Any {
    data.fold(0, (acc, x) -> acc + x) # Assuming all data is numeric
}
let aggregated_df = aggregate_dataframe(df, sum_func)

# Print the aggregated DataFrame
aggregated_df.data.forEach(series -> {
    print(series.data.join(", "))
})
