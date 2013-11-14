puppet-spark
============

Puppet module to install Spark (0.8.0)


Unfortunately no Debian packages are available for Spark, and the pre-compiled Spark versions are not compatible with CDH 4.4.0.

Use the following commands to compile Spark 0.8.0 and place the resulting .tgz file in the files/ directory.
Note: Spark 0.8.0 does not compile with YARN enabled against YARN CDH4.4.0.

```bash
wget https://github.com/apache/incubator-spark/archive/v0.8.0-incubating.tar.gz
tar xvf v0.8.0-incubating.tar.gz
cd incubator-spark-0.8.0-incubating/
./make-distribution.sh --hadoop 2.0.0-cdh4.4.0 --tgz
```
