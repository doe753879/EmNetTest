# NetSysTest  

## About

This repository contains all of the artifacts of the project.

Our artifact includes the following (ordered by sections):

| Item | Description | Corresponding content in the paper | Relation to prior work |
|------|-------------|------------------------------------|------------------------|
| [Vulnerability analysis](https://github.com/doe753879/EmNetTest/blob/master/) | Study of a dataset of CVE related to packet manipulation | Section V. ENS Vulnerabilities and testing | Show the characteristics of previous detected vulnerabilities on Network Stacks |
| [Source code of EmNetTest](https://github.com/doe753879/packetdrill-script-generator/tree/88b2a7e7a1170ebee43bc76d41fa0edf05797d0b) | Source code of the framework developed to systematically generate and run test | Section VI. EmNetTest: Design and implementation | Implementation of a framework capable to detect vulneabilities using systematic generation of tests |
| [Reports for discovered vulnerabilities](Vulnerabilities/Unknown/) | Packetdrill scripts that have triggered crashes on the Network stacks | Section VII (D). RQ4: Systematic Testing With EmNetTest | Known vulnerabilities and new vulnerabilities discovered for the network stacks|


## Vulnerability analysis

The vulnerabilities have been analyzed and the vulnerability study spreadsheet [Characterizing Vulnerabilities in RTOSes.xlsx](https://github.com/doe753879/EmNetTest/blob/master/Characterizing%20Vulnerabilities%20in%20RTOSes.xlsx) is located at the root of this repository.

## Source code of EmNetTest

A framework for systematically test the emmbeded network stacks has been developed, you can found the source code on the following repository: [Packetdrill Script Generator](https://github.com/doe753879/packetdrill-script-generator/tree/88b2a7e7a1170ebee43bc76d41fa0edf05797d0b)



## Reports for discovered vulnerabilities

During the systematic test, 12 [Known](Vulnerabilities/Known/) vulnerabilities were triggered, and 7 [Unknown](Vulnerabilities/Unknown/) vulnerabilities were discovered. You can find the packetdrill script responsible for triggering these vulnerabilities in this repository.


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
