# From the Deep

In this problem, you'll write freeform responses to the questions provided in the specification.

## Random Partitioning
As this is a random partitioning of the data, there is an equal chance for each boat to collect the observations. With this in mind, there is a high probability that the researcher will need to run SQL queries to collect data from each of the boats.

Through my own intuition this Random Parititioning of the data would works well for a very large data as it distribute the storage of data equally among all the boats (methaphor of databases). However, the major drawback of this approach is the large number of queries required to get all the recorded data from all the databases.

## Partitioning by Hour
With partitioning observations by hour, boat A will collected most of the data while other boats will collect fewer data (less frequent). This method works well when data comes in specific hours. This would lead to less query need to get all the necessary data. However if the data is expected to distributed equally in everyhour, the advantage of this approach disappers.

## Partitioning by Hash Value
As this is a time stamp, hash value approach will provide balance among all the ships through the Hash Value. However, as we could identified in the image, data are not equally group with the same category. Thus, this would pose as a limitation in the case that our applicaiton have data group together.
