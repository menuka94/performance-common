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
| Concurrent Users | The number of users accessing the application at the same time. | 50, 100, 200, 300, 500, 1000 |
| Message Size (Bytes) | The request payload size in Bytes. | 50, 1024, 10240 |
| Back-end Delay (ms) | The delay added by the Back-end service. | 0, 30, 500, 1000 |

The duration of each test is **900 seconds**. The warm-up period is **300 seconds**.
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
|  HTTPS echo service | 4G | 50 | 50 | 0 | 0 | 33693.26 | 1.44 | 1.86 | 3 | 99.97 |  |
|  HTTPS echo service | 4G | 50 | 50 | 30 | 0 | 1640.68 | 30.44 | 1.1 | 31 | 99.99 |  |
|  HTTPS echo service | 4G | 50 | 50 | 500 | 0 | 99.8 | 501.01 | 0.23 | 501 | 0 |  |
|  HTTPS echo service | 4G | 50 | 50 | 1000 | 0 | 49.91 | 1002 | 0.12 | 1003 | 0 |  |
|  HTTPS echo service | 4G | 50 | 1024 | 0 | 0 | 26105.33 | 1.86 | 1.91 | 4 | 99.96 |  |
|  HTTPS echo service | 4G | 50 | 1024 | 30 | 0 | 1637.08 | 30.49 | 1.09 | 31 | 99.99 |  |
|  HTTPS echo service | 4G | 50 | 1024 | 500 | 0 | 99.81 | 501.02 | 0.35 | 501 | 100 |  |
|  HTTPS echo service | 4G | 50 | 1024 | 1000 | 0 | 49.9 | 1002 | 0.07 | 1003 | 0 |  |
|  HTTPS echo service | 4G | 50 | 10240 | 0 | 0 | 12580.24 | 3.92 | 1.97 | 8 | 99.94 |  |
|  HTTPS echo service | 4G | 50 | 10240 | 30 | 0 | 1630.93 | 30.62 | 0.81 | 31 | 99.99 |  |
|  HTTPS echo service | 4G | 50 | 10240 | 500 | 0 | 99.76 | 501.03 | 0.4 | 503 | 99.99 |  |
|  HTTPS echo service | 4G | 50 | 10240 | 1000 | 0 | 49.88 | 1002.01 | 0.36 | 1003 | 99.99 |  |
|  HTTPS echo service | 4G | 100 | 50 | 0 | 0 | 33123.36 | 2.91 | 3.63 | 8 | 99.97 |  |
|  HTTPS echo service | 4G | 100 | 50 | 30 | 0 | 3279.26 | 30.45 | 1.54 | 31 | 99.99 |  |
|  HTTPS echo service | 4G | 100 | 50 | 500 | 0 | 199.63 | 501.03 | 0.61 | 503 | 0 |  |
|  HTTPS echo service | 4G | 100 | 50 | 1000 | 0 | 99.83 | 1002.01 | 0.46 | 1003 | 0 |  |
|  HTTPS echo service | 4G | 100 | 1024 | 0 | 0 | 26218.91 | 3.69 | 3.98 | 11 | 99.95 |  |
|  HTTPS echo service | 4G | 100 | 1024 | 30 | 0 | 3274.76 | 30.49 | 1.7 | 31 | 99.98 |  |
|  HTTPS echo service | 4G | 100 | 1024 | 500 | 0 | 199.66 | 501.05 | 0.71 | 503 | 99.99 |  |
|  HTTPS echo service | 4G | 100 | 1024 | 1000 | 0 | 99.8 | 1002.01 | 0.48 | 1003 | 0 |  |
|  HTTPS echo service | 4G | 100 | 10240 | 0 | 0 | 12288.24 | 8.02 | 4.91 | 22 | 99.93 |  |
|  HTTPS echo service | 4G | 100 | 10240 | 30 | 0 | 3258 | 30.66 | 1.3 | 31 | 99.97 |  |
|  HTTPS echo service | 4G | 100 | 10240 | 500 | 0 | 199.51 | 501.11 | 0.89 | 503 | 99.99 |  |
|  HTTPS echo service | 4G | 100 | 10240 | 1000 | 0 | 99.78 | 1002.01 | 0.51 | 1003 | 99.99 |  |
|  HTTPS echo service | 4G | 200 | 50 | 0 | 0 | 31511.63 | 6.01 | 8.74 | 38 | 99.95 | 49.72 |
|  HTTPS echo service | 4G | 200 | 50 | 30 | 0 | 6546.96 | 30.48 | 1.89 | 32 | 99.98 | 50.121 |
|  HTTPS echo service | 4G | 200 | 50 | 500 | 0 | 399.26 | 501.06 | 1.11 | 503 | 99.98 | 61.075 |
|  HTTPS echo service | 4G | 200 | 50 | 1000 | 0 | 199.6 | 1002.01 | 0.73 | 1003 | 99.72 | 58.681 |
|  HTTPS echo service | 4G | 200 | 1024 | 0 | 0 | 25008.43 | 7.54 | 10.37 | 44 | 99.93 | 50.056 |
|  HTTPS echo service | 4G | 200 | 1024 | 30 | 0 | 6541.46 | 30.53 | 2.45 | 31 | 99.97 | 50.176 |
|  HTTPS echo service | 4G | 200 | 1024 | 500 | 0 | 399.3 | 501.07 | 1.04 | 503 | 99.99 | 51.539 |
|  HTTPS echo service | 4G | 200 | 1024 | 1000 | 0 | 199.6 | 1002.01 | 0.53 | 1003 | 99.98 | 62.287 |
|  HTTPS echo service | 4G | 200 | 10240 | 0 | 0 | 12008.59 | 16.18 | 14.07 | 66 | 99.89 | 43.22 |
|  HTTPS echo service | 4G | 200 | 10240 | 30 | 0 | 6481.3 | 30.8 | 2.33 | 32 | 99.93 | 50.715 |
|  HTTPS echo service | 4G | 200 | 10240 | 500 | 0 | 399.03 | 501.14 | 1.32 | 503 | 99.98 | 50.726 |
|  HTTPS echo service | 4G | 200 | 10240 | 1000 | 0 | 199.51 | 1002.01 | 0.54 | 1003 | 99.98 | 49.015 |
|  HTTPS echo service | 4G | 300 | 50 | 0 | 0 | 61732.76 | 4.36 | 4.77 | 18 | 99.9 | 57.57 |
|  HTTPS echo service | 4G | 300 | 50 | 30 | 0 | 9848.27 | 30.41 | 2.73 | 31 | 99.96 | 57.816 |
|  HTTPS echo service | 4G | 300 | 50 | 500 | 0 | 598.99 | 501.04 | 1.26 | 501 | 99.98 | 70.839 |
|  HTTPS echo service | 4G | 300 | 50 | 1000 | 0 | 299.37 | 1002.01 | 0.66 | 1003 | 99.98 | 72.625 |
|  HTTPS echo service | 4G | 300 | 1024 | 0 | 0 | 48696.8 | 5.81 | 7.88 | 40 | 99.86 | 57.254 |
|  HTTPS echo service | 4G | 300 | 1024 | 30 | 0 | 9834.72 | 30.45 | 2.66 | 31 | 99.95 | 57.822 |
|  HTTPS echo service | 4G | 300 | 1024 | 500 | 0 | 598.92 | 501.05 | 1.35 | 503 | 99.98 | 64.131 |
|  HTTPS echo service | 4G | 300 | 1024 | 1000 | 0 | 299.37 | 1002.01 | 0.61 | 1003 | 99.98 | 70.914 |
|  HTTPS echo service | 4G | 300 | 10240 | 0 | 0 | 15901.02 | 18.81 | 13.15 | 64 | 99.87 | 58.023 |
|  HTTPS echo service | 4G | 300 | 10240 | 30 | 0 | 9717.55 | 30.82 | 2.24 | 32 | 99.89 | 58.632 |
|  HTTPS echo service | 4G | 300 | 10240 | 500 | 0 | 598.5 | 501.06 | 1.05 | 503 | 99.97 | 58.624 |
|  HTTPS echo service | 4G | 300 | 10240 | 1000 | 0 | 299.25 | 1002.03 | 0.89 | 1003 | 99.98 | 62.912 |
|  HTTPS echo service | 4G | 500 | 50 | 0 | 0 | 60000.18 | 7.5 | 8.61 | 45 | 99.85 | 65.369 |
|  HTTPS echo service | 4G | 500 | 50 | 30 | 0 | 16368.79 | 30.5 | 3.8 | 31 | 99.94 | 67.049 |
|  HTTPS echo service | 4G | 500 | 50 | 500 | 0 | 998.29 | 501.03 | 1.14 | 501 | 99.97 | 73.246 |
|  HTTPS echo service | 4G | 500 | 50 | 1000 | 0 | 498.98 | 1002.01 | 0.81 | 1003 | 99.98 | 78.483 |
|  HTTPS echo service | 4G | 500 | 1024 | 0 | 0 | 47231.63 | 10.04 | 13.76 | 76 | 99.81 | 72.453 |
|  HTTPS echo service | 4G | 500 | 1024 | 30 | 0 | 16332.18 | 30.56 | 3.72 | 31 | 99.91 | 73.162 |
|  HTTPS echo service | 4G | 500 | 1024 | 500 | 0 | 998.14 | 501.06 | 1.45 | 501 | 99.97 | 80.622 |
|  HTTPS echo service | 4G | 500 | 1024 | 1000 | 0 | 498.94 | 1002.01 | 0.8 | 1003 | 99.97 | 76.127 |
|  HTTPS echo service | 4G | 500 | 10240 | 0 | 0 | 15579.01 | 32.04 | 29.86 | 134 | 99.8 | 73.231 |
|  HTTPS echo service | 4G | 500 | 10240 | 30 | 0 | 13964.15 | 35.75 | 8.71 | 76 | 99.77 | 73.699 |
|  HTTPS echo service | 4G | 500 | 10240 | 500 | 0 | 997.58 | 501.07 | 1.23 | 503 | 99.94 | 75.354 |
|  HTTPS echo service | 4G | 500 | 10240 | 1000 | 0 | 498.79 | 1002.03 | 0.91 | 1003 | 99.96 | 81.581 |
|  HTTPS echo service | 4G | 1000 | 50 | 0 | 0 | 56503.93 | 15.95 | 19.48 | 109 | 99.75 | 110.416 |
|  HTTPS echo service | 4G | 1000 | 50 | 30 | 0 | 32306.16 | 30.89 | 6.32 | 32 | 99.82 | 110.021 |
|  HTTPS echo service | 4G | 1000 | 50 | 500 | 0 | 1996 | 501.13 | 2.61 | 503 | 99.94 | 115.621 |
|  HTTPS echo service | 4G | 1000 | 50 | 1000 | 0 | 997.81 | 1002.04 | 1.47 | 1003 | 99.96 | 118.799 |
|  HTTPS echo service | 4G | 1000 | 1024 | 0 | 0 | 44664.95 | 21.49 | 33.71 | 169 | 99.66 | 108.416 |
|  HTTPS echo service | 4G | 1000 | 1024 | 30 | 0 | 32054.22 | 31.12 | 6.46 | 51 | 99.72 | 101.884 |
|  HTTPS echo service | 4G | 1000 | 1024 | 500 | 0 | 1995.98 | 501.12 | 2.46 | 501 | 99.91 | 111.176 |
|  HTTPS echo service | 4G | 1000 | 1024 | 1000 | 0 | 997.86 | 1002.05 | 1.46 | 1003 | 99.94 | 111.536 |
|  HTTPS echo service | 4G | 1000 | 10240 | 0 | 0 | 14927.83 | 66.92 | 90.88 | 475 | 99.67 | 102.443 |
|  HTTPS echo service | 4G | 1000 | 10240 | 30 | 0 | 13514.22 | 73.93 | 33.94 | 196 | 99.63 | 109.654 |
|  HTTPS echo service | 4G | 1000 | 10240 | 500 | 0 | 1994.81 | 501.13 | 1.9 | 503 | 99.91 | 104.692 |
|  HTTPS echo service | 4G | 1000 | 10240 | 1000 | 0 | 997.37 | 1002.07 | 1.69 | 1003 | 99.9 | 112.574 |
|  HTTP echo service | 4G | 50 | 50 | 0 | 0 | 40396.68 | 1.2 | 1.8 | 2 | 99.98 |  |
|  HTTP echo service | 4G | 50 | 50 | 30 | 0 | 1644.03 | 30.38 | 1.2 | 31 | 100 |  |
|  HTTP echo service | 4G | 50 | 50 | 500 | 0 | 99.79 | 501.04 | 1.73 | 501 | 0 |  |
|  HTTP echo service | 4G | 50 | 50 | 1000 | 0 | 49.91 | 1002 | 0.3 | 1003 | 0 |  |
|  HTTP echo service | 4G | 50 | 1024 | 0 | 0 | 35414.44 | 1.37 | 1.85 | 2 | 99.98 |  |
|  HTTP echo service | 4G | 50 | 1024 | 30 | 0 | 1639.92 | 30.44 | 1.15 | 31 | 100 |  |
|  HTTP echo service | 4G | 50 | 1024 | 500 | 0 | 99.82 | 501.01 | 0.48 | 501 | 0 |  |
|  HTTP echo service | 4G | 50 | 1024 | 1000 | 0 | 49.9 | 1002 | 0.17 | 1003 | 0 |  |
|  HTTP echo service | 4G | 50 | 10240 | 0 | 0 | 26591.74 | 1.82 | 1.94 | 3 | 99.99 |  |
|  HTTP echo service | 4G | 50 | 10240 | 30 | 0 | 1638.28 | 30.47 | 1.03 | 31 | 99.99 |  |
|  HTTP echo service | 4G | 50 | 10240 | 500 | 0 | 99.81 | 501.01 | 0.48 | 501 | 0 |  |
|  HTTP echo service | 4G | 50 | 10240 | 1000 | 0 | 49.91 | 1002.01 | 0.48 | 1003 | 0 |  |
|  HTTP echo service | 4G | 100 | 50 | 0 | 0 | 39092.23 | 2.44 | 3.5 | 6 | 99.98 |  |
|  HTTP echo service | 4G | 100 | 50 | 30 | 0 | 3277.32 | 30.47 | 1.88 | 31 | 99.99 |  |
|  HTTP echo service | 4G | 100 | 50 | 500 | 0 | 199.77 | 501.07 | 1.38 | 503 | 0 |  |
|  HTTP echo service | 4G | 100 | 50 | 1000 | 0 | 99.79 | 1002.03 | 2.36 | 1003 | 0 |  |
|  HTTP echo service | 4G | 100 | 1024 | 0 | 0 | 34330.68 | 2.79 | 3.57 | 7 | 99.98 |  |
|  HTTP echo service | 4G | 100 | 1024 | 30 | 0 | 3283.24 | 30.42 | 1.83 | 31 | 99.99 |  |
|  HTTP echo service | 4G | 100 | 1024 | 500 | 0 | 199.67 | 501.02 | 0.78 | 501 | 0 |  |
|  HTTP echo service | 4G | 100 | 1024 | 1000 | 0 | 99.86 | 1002 | 0.25 | 1003 | 0 |  |
|  HTTP echo service | 4G | 100 | 10240 | 0 | 0 | 25509.26 | 3.77 | 4.28 | 9 | 99.98 |  |
|  HTTP echo service | 4G | 100 | 10240 | 30 | 0 | 3281.86 | 30.43 | 1.49 | 31 | 99.99 |  |
|  HTTP echo service | 4G | 100 | 10240 | 500 | 0 | 199.64 | 501.01 | 0.56 | 501 | 0 |  |
|  HTTP echo service | 4G | 100 | 10240 | 1000 | 0 | 99.8 | 1002.02 | 0.76 | 1003 | 0 |  |
|  HTTP echo service | 4G | 200 | 50 | 0 | 0 | 39695.07 | 4.54 | 8.15 | 30 | 99.97 |  |
|  HTTP echo service | 4G | 200 | 50 | 30 | 0 | 6561.6 | 30.44 | 2.25 | 31 | 99.98 |  |
|  HTTP echo service | 4G | 200 | 50 | 500 | 0 | 399.33 | 501.02 | 0.79 | 501 | 99.99 |  |
|  HTTP echo service | 4G | 200 | 50 | 1000 | 0 | 199.59 | 1002.01 | 0.45 | 1003 | 0 |  |
|  HTTP echo service | 4G | 200 | 1024 | 0 | 0 | 32807.6 | 5.61 | 8.24 | 31 | 99.97 |  |
|  HTTP echo service | 4G | 200 | 1024 | 30 | 0 | 6553.19 | 30.46 | 2.38 | 31 | 99.98 |  |
|  HTTP echo service | 4G | 200 | 1024 | 500 | 0 | 399.33 | 501.02 | 0.67 | 501 | 99.99 |  |
|  HTTP echo service | 4G | 200 | 1024 | 1000 | 0 | 199.59 | 1002 | 0.45 | 1003 | 0 |  |
|  HTTP echo service | 4G | 200 | 10240 | 0 | 0 | 23915.62 | 7.68 | 10.72 | 40 | 99.97 |  |
|  HTTP echo service | 4G | 200 | 10240 | 30 | 0 | 6552.5 | 30.48 | 1.99 | 31 | 99.98 |  |
|  HTTP echo service | 4G | 200 | 10240 | 500 | 0 | 399.31 | 501.04 | 0.94 | 501 | 99.99 |  |
|  HTTP echo service | 4G | 200 | 10240 | 1000 | 0 | 199.58 | 1002.01 | 0.4 | 1003 | 0 |  |
|  HTTP echo service | 4G | 300 | 50 | 0 | 0 | 75787.4 | 3.44 | 3.88 | 9 | 99.94 |  |
|  HTTP echo service | 4G | 300 | 50 | 30 | 0 | 9865.12 | 30.37 | 2.7 | 31 | 99.97 |  |
|  HTTP echo service | 4G | 300 | 50 | 500 | 0 | 599.01 | 501.02 | 0.83 | 501 | 99.99 |  |
|  HTTP echo service | 4G | 300 | 50 | 1000 | 0 | 299.39 | 1002.01 | 0.78 | 1003 | 99.99 |  |
|  HTTP echo service | 4G | 300 | 1024 | 0 | 0 | 65088.62 | 4.05 | 4.09 | 10 | 99.94 |  |
|  HTTP echo service | 4G | 300 | 1024 | 30 | 0 | 9867.62 | 30.36 | 2.63 | 31 | 99.98 |  |
|  HTTP echo service | 4G | 300 | 1024 | 500 | 0 | 599.1 | 501.01 | 0.6 | 501 | 99.99 |  |
|  HTTP echo service | 4G | 300 | 1024 | 1000 | 0 | 299.36 | 1002.01 | 0.57 | 1003 | 99.99 |  |
|  HTTP echo service | 4G | 300 | 10240 | 0 | 0 | 49980.48 | 5.4 | 4.62 | 12 | 99.94 |  |
|  HTTP echo service | 4G | 300 | 10240 | 30 | 0 | 9835.42 | 30.45 | 2.52 | 31 | 99.98 |  |
|  HTTP echo service | 4G | 300 | 10240 | 500 | 0 | 598.91 | 501.02 | 1.12 | 501 | 99.99 |  |
|  HTTP echo service | 4G | 300 | 10240 | 1000 | 0 | 299.39 | 1002.01 | 0.85 | 1003 | 99.99 |  |
|  HTTP echo service | 4G | 500 | 50 | 0 | 0 | 71726.68 | 6.06 | 6.82 | 25 | 99.91 |  |
|  HTTP echo service | 4G | 500 | 50 | 30 | 0 | 16408.76 | 30.43 | 3.57 | 31 | 99.96 |  |
|  HTTP echo service | 4G | 500 | 50 | 500 | 0 | 998.37 | 501.04 | 1.5 | 501 | 99.98 |  |
|  HTTP echo service | 4G | 500 | 50 | 1000 | 0 | 498.99 | 1002.01 | 0.81 | 1003 | 99.99 |  |
|  HTTP echo service | 4G | 500 | 1024 | 0 | 0 | 63735.65 | 6.89 | 7.12 | 27 | 99.9 |  |
|  HTTP echo service | 4G | 500 | 1024 | 30 | 0 | 16385.17 | 30.46 | 3.62 | 31 | 99.95 |  |
|  HTTP echo service | 4G | 500 | 1024 | 500 | 0 | 998.28 | 501.03 | 1.31 | 501 | 99.98 |  |
|  HTTP echo service | 4G | 500 | 1024 | 1000 | 0 | 498.96 | 1002.02 | 1.09 | 1003 | 99.99 |  |
|  HTTP echo service | 4G | 500 | 10240 | 0 | 0 | 47646.1 | 9.46 | 8.62 | 35 | 99.92 |  |
|  HTTP echo service | 4G | 500 | 10240 | 30 | 0 | 16329.4 | 30.57 | 3.47 | 31 | 99.96 |  |
|  HTTP echo service | 4G | 500 | 10240 | 500 | 0 | 998.1 | 501.05 | 1.52 | 501 | 99.98 |  |
|  HTTP echo service | 4G | 500 | 10240 | 1000 | 0 | 498.95 | 1002.01 | 0.67 | 1003 | 99.99 |  |
|  HTTP echo service | 4G | 1000 | 50 | 0 | 0 | 68567.79 | 12.58 | 15.02 | 82 | 99.82 |  |
|  HTTP echo service | 4G | 1000 | 50 | 30 | 0 | 32437.17 | 30.78 | 6.12 | 31 | 99.89 |  |
|  HTTP echo service | 4G | 1000 | 50 | 500 | 0 | 1996.31 | 501.09 | 2.3 | 501 | 99.96 |  |
|  HTTP echo service | 4G | 1000 | 50 | 1000 | 0 | 998.1 | 1002.02 | 1.22 | 1003 | 99.96 |  |
|  HTTP echo service | 4G | 1000 | 1024 | 0 | 0 | 59555.66 | 14.68 | 14.99 | 83 | 99.83 |  |
|  HTTP echo service | 4G | 1000 | 1024 | 30 | 0 | 32389.9 | 30.82 | 6.22 | 31 | 99.89 |  |
|  HTTP echo service | 4G | 1000 | 1024 | 500 | 0 | 1996.53 | 501.08 | 2.17 | 501 | 99.96 |  |
|  HTTP echo service | 4G | 1000 | 1024 | 1000 | 0 | 997.83 | 1002.03 | 1.32 | 1003 | 99.96 |  |
|  HTTP echo service | 4G | 1000 | 10240 | 0 | 0 | 45480.86 | 19.58 | 16.98 | 90 | 99.85 |  |
|  HTTP echo service | 4G | 1000 | 10240 | 30 | 0 | 32187.79 | 31.01 | 6.14 | 33 | 99.89 |  |
|  HTTP echo service | 4G | 1000 | 10240 | 500 | 0 | 1995.98 | 501.08 | 2.07 | 501 | 99.96 |  |
|  HTTP echo service | 4G | 1000 | 10240 | 1000 | 0 | 997.84 | 1002.03 | 1.16 | 1003 | 99.97 |  |
