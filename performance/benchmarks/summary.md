# Back-end Server Performance Test Results

These are the performance test results of a [Netty](https://netty.io/) based Back-end service which echoes back any request
posted to it after a specified period of time. This is the Back-end that is used in the performance tests of WSO2 products.

| Test Scenarios | Description |
| --- | --- |
| HTTP echo service | An HTTP echo service implemented in Netty |
| HTTPS echo service | An HTTPS echo service implemented in Netty |

Our test client is [Apache JMeter](https://jmeter.apache.org/index.html). We test each scenario for a fixed duration of
time. We split the test results into warmup and measurement parts and use the measurement part to compute the
performance metrics.

We run the Back-end performance tests under different numbers of concurrent users, message sizes (payloads) and Back-end service
delays.

The main performance metrics:

1. **Throughput**: The number of requests that the Back-end Server processes during a specific time interval (e.g. per second).
2. **Response Time**: The end-to-end latency for an operation of invoking an API. The complete distribution of response times was recorded.

In addition to the above metrics, we measure the load average and several memory-related metrics.

The following are the test parameters.

| Test Parameter | Description | Values |
| --- | --- | --- |
| Scenario Name | The name of the test scenario. | Refer to the above table. |
| Heap Size | The amount of memory allocated to the application | 4G |
| Concurrent Users | The number of users accessing the application at the same time. | 100, 200 |
| Message Size (Bytes) | The request payload size in Bytes. | 50, 1024 |
| Back-end Delay (ms) | The delay added by the Back-end service. | 0, 30 |

The duration of each test is **180 seconds**. The warm-up period is **120 seconds**.
The measurement results are collected after the warm-up period.

A [**c5.xlarge** Amazon EC2 instance](https://aws.amazon.com/ec2/instance-types/) was used to install Back-end Server.

The following are the measurements collected from each performance test conducted for a given combination of
test parameters.

| Measurement | Description |
| --- | --- |
| Error % | Percentage of requests with errors |
| Average Response Time (ms) | The average response time of a set of results |
| Standard Deviation of Response Time (ms) | The “Standard Deviation” of the response time. |
| 99th Percentile of Response Time (ms) | 99% of the requests took no more than this time. The remaining samples took at least as long as this |
| Throughput (Requests/sec) | The throughput measured in requests per second. |
| Average Memory Footprint After Full GC (M) | The average memory consumed by the application after a full garbage collection event. |

The following is the summary of performance test results collected for the measurement period.

|  Scenario Name | Heap Size | Concurrent Users | Message Size (Bytes) | Back-end Service Delay (ms) | Error % | Throughput (Requests/sec) | Average Response Time (ms) | Standard Deviation of Response Time (ms) | 99th Percentile of Response Time (ms) | Back-end Server GC Throughput (%) | Average Back-end Server Memory Footprint After Full GC (M) |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
|  HTTPS echo service | 4G | 100 | 50 | 0 | 0 | 33191.88 | 2.9 | 3.55 | 8 | 99.92 |  |
|  HTTPS echo service | 4G | 100 | 50 | 30 | 0 | 3265.98 | 30.56 | 1.69 | 31 | 99.96 |  |
|  HTTPS echo service | 4G | 100 | 1024 | 0 | 0 | 26526.66 | 3.65 | 3.78 | 10 | 99.91 |  |
|  HTTPS echo service | 4G | 100 | 1024 | 30 | 0 | 3255.84 | 30.64 | 1.83 | 31 | 99.95 |  |
|  HTTPS echo service | 4G | 200 | 50 | 0 | 0 | 33784.24 | 5.54 | 9.13 | 40 | 99.88 | 49.482 |
|  HTTPS echo service | 4G | 200 | 50 | 30 | 0 | 6564.52 | 30.42 | 2.41 | 31 | 99.92 | 50.152 |
|  HTTPS echo service | 4G | 200 | 1024 | 0 | 0 | 26401.63 | 7.12 | 10.68 | 44 | 99.85 | 49.935 |
|  HTTPS echo service | 4G | 200 | 1024 | 30 | 0 | 6555.27 | 30.46 | 2.31 | 31 | 99.91 | 49.697 |
|  HTTP echo service | 4G | 100 | 50 | 0 | 0 | 40833.22 | 2.33 | 3.34 | 6 | 99.94 |  |
|  HTTP echo service | 4G | 100 | 50 | 30 | 0 | 3269.16 | 30.54 | 1.8 | 31 | 99.98 |  |
|  HTTP echo service | 4G | 100 | 1024 | 0 | 0 | 33986.74 | 2.8 | 3.62 | 7 | 99.94 |  |
|  HTTP echo service | 4G | 100 | 1024 | 30 | 0 | 3268.86 | 30.54 | 1.56 | 31 | 99.98 |  |
|  HTTP echo service | 4G | 200 | 50 | 0 | 0 | 39763.68 | 4.5 | 8.52 | 32 | 99.91 |  |
|  HTTP echo service | 4G | 200 | 50 | 30 | 0 | 6573.62 | 30.39 | 2.44 | 31 | 99.95 |  |
|  HTTP echo service | 4G | 200 | 1024 | 0 | 0 | 33100.09 | 5.49 | 8.28 | 31 | 99.91 |  |
|  HTTP echo service | 4G | 200 | 1024 | 30 | 0 | 6571.91 | 30.38 | 2.26 | 31 | 99.95 |  |
