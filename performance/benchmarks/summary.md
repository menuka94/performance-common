# Backend Server Performance Test Results

These are the performance test results of a [Netty](https://netty.io/) based back-end service which echoes back any request
posted to it after a specified period of time. This is the backend that is used in the performance tests of WSO2 products.

| Test Scenarios | Description |
| --- | --- |
| HTTP echo service | An HTTP echo service implemented in Netty |
| HTTPS echo service | An HTTPS echo service implemented in Netty |

Our test client is [Apache JMeter](https://jmeter.apache.org/index.html). We test each scenario for a fixed duration of
time. We split the test results into warmup and measurement parts and use the measurement part to compute the
performance metrics.

We run the backend performance tests under different numbers of concurrent users, message sizes (payloads) and back-end service
delays.

The main performance metrics:

1. **Throughput**: The number of requests that the Backend Server processes during a specific time interval (e.g. per second).
2. **Response Time**: The end-to-end latency for an operation of invoking an API. The complete distribution of response times was recorded.

In addition to the above metrics, we measure the load average and several memory-related metrics.

The following are the test parameters.

| Test Parameter | Description | Values |
| --- | --- | --- |
| Scenario Name | The name of the test scenario. | Refer to the above table. |
| Heap Size | The amount of memory allocated to the application | 2G |
| Concurrent Users | The number of users accessing the application at the same time. | 100, 200 |
| Message Size (Bytes) | The request payload size in Bytes. | 50, 1024 |
| Back-end Delay (ms) | The delay added by the back-end service. | 0 |

The duration of each test is **120 seconds**. The warm-up period is **60 seconds**.
The measurement results are collected after the warm-up period.

A [**t3.medium** Amazon EC2 instance](https://aws.amazon.com/ec2/instance-types/) was used to install Backend Server.

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

|  Scenario Name | Heap Size | Concurrent Users | Message Size (Bytes) | Back-end Service Delay (ms) | Error % | Throughput (Requests/sec) | Average Response Time (ms) | Standard Deviation of Response Time (ms) | 99th Percentile of Response Time (ms) | Backend GC Throughput (%) | Average Backend Memory Footprint After Full GC (M) |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
|  HTTPS echo service | 2G | 100 | 50 | 0 | 0 | 12472.48 | 7.87 | 4.84 | 16 |  |  |
|  HTTPS echo service | 2G | 100 | 1024 | 0 | 0 | 8923.32 | 10.98 | 6.91 | 36 |  |  |
|  HTTPS echo service | 2G | 200 | 50 | 0 | 0 | 9785.4 | 18.94 | 17.13 | 87 |  |  |
|  HTTPS echo service | 2G | 200 | 1024 | 0 | 0 | 8946.82 | 21.65 | 14.71 | 85 |  |  |
|  HTTP echo service | 2G | 100 | 50 | 0 | 0 | 17638.61 | 5.57 | 3.03 | 10 |  |  |
|  HTTP echo service | 2G | 100 | 1024 | 0 | 0 | 10407.08 | 9.35 | 5.36 | 17 |  |  |
|  HTTP echo service | 2G | 200 | 50 | 0 | 0 | 11767.16 | 16.4 | 12.17 | 60 |  |  |
|  HTTP echo service | 2G | 200 | 1024 | 0 | 0 | 10345.35 | 18.1 | 12.19 | 62 |  |  |
