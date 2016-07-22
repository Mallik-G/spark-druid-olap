CREATE TABLE if not exists orderlineitempartsupplierbase
 ( 
    o_orderkey      INT, 
    o_custkey       INT, 
    o_orderstatus   STRING, 
    o_totalprice    DOUBLE, 
    o_orderdate     STRING, 
    o_orderpriority STRING, 
    o_clerk         STRING, 
    o_shippriority  STRING, 
    o_comment       STRING, 
    l_partkey       STRING, 
    l_suppkey       STRING, 
    l_linenumber    STRING, 
    l_quantity      bigint, 
    l_extendedprice DOUBLE, 
    l_discount      DOUBLE, 
    l_tax           DOUBLE, 
    l_returnflag    STRING, 
    l_linestatus    STRING, 
    l_shipdate      STRING, 
    l_commitdate    STRING, 
    l_receiptdate   STRING, 
    l_shipinstruct  STRING, 
    l_shipmode      STRING, 
    l_comment       STRING, 
    order_year      STRING, 
    ps_partkey      STRING, 
    ps_suppkey      STRING, 
    ps_availqty     STRING, 
    ps_supplycost   DOUBLE, 
    ps_comment      STRING, 
    s_name          STRING, 
    s_address       STRING, 
    s_phone         STRING, 
    s_acctbal       DOUBLE, 
    s_comment       STRING, 
    s_nation        STRING, 
    s_region        STRING, 
    p_name          STRING, 
    p_mfgr          STRING, 
    p_brand         STRING, 
    p_type          STRING, 
    p_size          INT, 
    p_container     STRING, 
    p_retailprice   DOUBLE, 
    p_comment       STRING, 
    c_name          STRING, 
    c_address       STRING, 
    c_phone         STRING, 
    c_acctbal       DOUBLE, 
    c_mktsegment    STRING, 
    c_comment       STRING, 
    c_nation        STRING, 
    c_region        STRING 
 ) 
USING com.databricks.spark.csv
      OPTIONS (path "s3://tpchdataset/datascale1/orderLineItemPartSupplierCustomer/",
      header "false", delimiter "|")
;

CREATE TABLE if not exists sparkline_tpch
      USING org.sparklinedata.druid
      OPTIONS (sourceDataframe "orderLineItemPartSupplierBase",
      timeDimensionColumn "l_shipdate",
      druidDatasource "tpch_1",
      druidHost "__MASTER_PUBLIC_HOSTNAME__",
      zkQualifyDiscoveryNames "true",
      queryHistoricalServers "true",
      numSegmentsPerHistoricalQuery "10",
      columnMapping '{}',
      functionalDependencies '[]',
      starSchema ' {   "factTable" : "sparkline_tpch",   "relations" : [ ] }   ')
;
