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
def create_series(data, index):
    return Series { data: data, index: index }

# Function to create a DataFrame
def create_dataframe(data, columns):
    return DataFrame { data: data, columns: columns }

# Example function to add a column to a DataFrame
def add_column(df, column_name, series):
    new_columns = df.columns ++ [column_name]
    new_data = df.data ++ [series]
    return DataFrame { data: new_data, columns: new_columns }
