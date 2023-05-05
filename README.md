# NetSysTest  
## How to run this project?  
First, clone this repository(Note you can also clone this repo accrodingly)  
```bash
git clone https://github.com/doe753879/EmSysTest.git   
```
If you have already had the IPStack project, you could specify the project path to build them at the same time.
```bash
make TARGET=FreeRTOS path=/path/to/your/Demo/program
```
Run  make in the root folder and specify the target IPStack you would like to use(e.g. for FreeRTOS)  
```bash
make TARGET=FreeRTOS
```
When the project is build, run make run and specify the target and add some args with ARGS = ""(e.g. I want to run test.pkt)
```bash
make run target=FreeRTOS ARGS="--local_ip=125.0.75.0 --verbose --non_fatal=packet --tolerance_usecs=1000000 /path/to/test.pkt"
```
