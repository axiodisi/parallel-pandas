# parallel_pandas.bend

# Define the Series type
type Series[T] = {
    data: List[T],
    index: List[Int]
}

# Define the DataFrame type
type DataFrame = {
    data: List[Series[Any]],
    columns: List[String]
}

# Function to create a Series
let create_series = (data: List[T], index: List[Int]) -> Series[T] {
    {data: data, index: index}
}

# Function to create a DataFrame
let create_dataframe = (data: List[Series[Any]], columns: List[String]) -> DataFrame {
    {data: data, columns: columns}
}

# Function to filter DataFrame rows based on a condition
let filter_dataframe = (df: DataFrame, condition: (Series[Any]) -> Bool) -> DataFrame {
    let filtered_data = df.data.filter(condition)
    {data: filtered_data, columns: df.columns}
}

# Function to select specific columns from a DataFrame
let select_columns = (df: DataFrame, cols: List[String]) -> DataFrame {
    let selected_data = df.data.map(series -> {
        let indices = df.columns.map(col -> cols.indexOf(col))
        let new_data = indices.map(i -> series.data[i])
        create_series(new_data, series.index)
    })
    {data: selected_data, columns: cols}
}

# Function to aggregate DataFrame columns
let aggregate_dataframe = (df: DataFrame, agg_func: (List[Any]) -> Any) -> DataFrame {
    let aggregated_data = df.data.map(series -> {
        let agg_result = agg_func(series.data)
        create_series([agg_result], series.index)
    })
    {data: aggregated_data, columns: df.columns}
}

# Function to read CSV file into DataFrame
let read_csv = (file_path: String) -> DataFrame {
    # Pseudo-code for reading CSV file
    let lines = read_file(file_path).split("\n")
    let columns = lines[0].split(",")
    let data = lines[1:].map(line -> {
        let values = line.split(",")
        create_series(values, (0..values.length).toList())
    })
    create_dataframe(data, columns)
}

# Function to write DataFrame to CSV file
let write_csv = (df: DataFrame, file_path: String) -> Void {
    let header = df.columns.join(",")
    let rows = df.data.map(series -> series.data.join(","))
    let content = [header] + rows
    write_file(file_path, content.join("\n"))
}
