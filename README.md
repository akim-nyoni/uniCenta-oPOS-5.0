# uniCenta oPos 5.0

link for original files https://sourceforge.net/projects/unicentaopos/files/source

# Requirements to run the uploaded code:

* ## Java JDK 11
* ## Maven 3.9.8
* ## MySQL Database
* ## Internet Connection to download dependencies

## Overview

uniCenta oPos is an enterprise level point of sale system and it has the following feature set

* Sales
* Inventory
* Customers
* Suppliers
* Employees
* Reporting

It runs on the following operating systems

* Windows
* Linux
* Mac osX

Full details can be found here: https://unicenta.com

## Before you start
Install mysql (version 5X supported) and create a schema called unicentaopos

## Build and Run the appication
To get started, simply clone the repository and build the artifacts
### build the artifacts
```
mvn clean package
```
### run the application
```
java -jar ./target/unicentaopos
```

# Note: *if this java -jar ./target/unicentaopos fails. use start.bat or start.sh depending on operating system you using. start.bat and start.sh are located in the target folder*


