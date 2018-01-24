CREATE KEYSPACE IF NOT EXISTS seshat
    WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 }
    AND DURABLE_WRITES = true;

USE seshat;

CREATE TABLE applications (
    name text,
    description text,
    homepage text,
    vendor text,
    PRIMARY KEY (name)
) WITH
  comment=''
  AND read_repair_chance=0
  AND dclocal_read_repair_chance=0.1
  AND gc_grace_seconds=864000
  AND bloom_filter_fp_chance=0.01
  AND compaction={ 'class':'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy',
  'max_threshold':'32',
  'min_threshold':'4' }
  AND compression={ 'chunk_length_in_kb':'64',
  'class':'org.apache.cassandra.io.compress.LZ4Compressor' }
  AND caching={ 'keys':'ALL',
  'rows_per_partition':'NONE' }
  AND default_time_to_live=0
  AND id='47697bc0-fccd-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

  CREATE TABLE clients (
    name text,
    description text,
    homepage text,
    redirect_uri text,
    vendor text,
    PRIMARY KEY (name)
) WITH
  comment=''
  AND read_repair_chance=0
  AND dclocal_read_repair_chance=0.1
  AND gc_grace_seconds=864000
  AND bloom_filter_fp_chance=0.01
  AND compaction={ 'class':'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy',
  'max_threshold':'32',
  'min_threshold':'4' }
  AND compression={ 'chunk_length_in_kb':'64',
  'class':'org.apache.cassandra.io.compress.LZ4Compressor' }
  AND caching={ 'keys':'ALL',
  'rows_per_partition':'NONE' }
  AND default_time_to_live=0
  AND id='48e7de60-fccd-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE TABLE config (
    name text,
    secret blob,
    PRIMARY KEY (name)
) WITH
  comment=''
  AND read_repair_chance=0
  AND dclocal_read_repair_chance=0.1
  AND gc_grace_seconds=864000
  AND bloom_filter_fp_chance=0.01
  AND compaction={ 'class':'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy',
  'max_threshold':'32',
  'min_threshold':'4' }
  AND compression={ 'chunk_length_in_kb':'64',
  'class':'org.apache.cassandra.io.compress.LZ4Compressor' }
  AND caching={ 'keys':'ALL',
  'rows_per_partition':'NONE' }
  AND default_time_to_live=0
  AND id='451ca590-fccd-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE TABLE tenant_applications (
    tenant_identifier text,
    assigned_applications set<text>,
    PRIMARY KEY (tenant_identifier)
) WITH
  comment=''
  AND read_repair_chance=0
  AND dclocal_read_repair_chance=0.1
  AND gc_grace_seconds=864000
  AND bloom_filter_fp_chance=0.01
  AND compaction={ 'class':'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy',
  'max_threshold':'32',
  'min_threshold':'4' }
  AND compression={ 'chunk_length_in_kb':'64',
  'class':'org.apache.cassandra.io.compress.LZ4Compressor' }
  AND caching={ 'keys':'ALL',
  'rows_per_partition':'NONE' }
  AND default_time_to_live=0
  AND id='4826d850-fccd-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE TABLE tenants (
    identifier text,
    cluster_name text,
    contact_points text,
    description text,
    identity_manager_application_name text,
    identity_manager_application_uri text,
    keyspace_name text,
    name text,
    replicas text,
    replication_type text,
    PRIMARY KEY (identifier)
) WITH
  comment=''
  AND read_repair_chance=0
  AND dclocal_read_repair_chance=0.1
  AND gc_grace_seconds=864000
  AND bloom_filter_fp_chance=0.01
  AND compaction={ 'class':'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy',
  'max_threshold':'32',
  'min_threshold':'4' }
  AND compression={ 'chunk_length_in_kb':'64',
  'class':'org.apache.cassandra.io.compress.LZ4Compressor' }
  AND caching={ 'keys':'ALL',
  'rows_per_partition':'NONE' }
  AND default_time_to_live=0
  AND id='46b43580-fccd-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE TABLE "users" (
    name text,
    expires_in_days int,
    iteration_count int,
    password_reset_on timestamp,
    passwordword blob,
    salt blob,
    PRIMARY KEY (name)
) WITH
  comment=''
  AND read_repair_chance=0
  AND dclocal_read_repair_chance=0.1
  AND gc_grace_seconds=864000
  AND bloom_filter_fp_chance=0.01
  AND compaction={ 'class':'org.apache.cassandra.db.compaction.SizeTieredCompactionStrategy',
  'max_threshold':'32',
  'min_threshold':'4' }
  AND compression={ 'chunk_length_in_kb':'64',
  'class':'org.apache.cassandra.io.compress.LZ4Compressor' }
  AND caching={ 'keys':'ALL',
  'rows_per_partition':'NONE' }
  AND default_time_to_live=0
  AND id='45f3cbb0-fccd-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';
