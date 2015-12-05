# Spark-Ansible

An Ansible role for installing [Apache Spark](https://spark.apache.org).

## Role Variables

Below are the current variables. These can be edited/viewed in `"tasks/main.yml"`

- `spark_version:` - `"1.5.2-bin-hadoop2.6"`
- `spark_mirror:` - `"http://d3kbcqa49mib13.cloudfront.net"`
- `spark_conf_dir:` - `"/etc/spark"`
- `spark_usr_dir:` - `"/usr/lib/spark"`
- `spark_lib_dir:` - `"/var/lib/spark"`
- `spark_log_dir:` - `"/var/log/spark"`
- `spark_run_dir:` `"/run/spark"`
- `spark_env_extras:` {}

## Host File
The host file in this repo is currently set as follows:

   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[spark_worker]<br />
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;172.16.161.129<br />
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;172.16.161.130<br />
   
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;[spark_master]<br />
   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;172.16.161.129<br />
- To have this work with your machine you must change the above IP addresses to the ones in your Vagrant setup.

## To Run

   ```ansible-playbook -s -k -i hosts -u vagrant tasks/main.yml```
