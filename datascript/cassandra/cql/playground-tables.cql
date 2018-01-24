CREATE KEYSPACE IF NOT EXISTS playground
    WITH REPLICATION = { 'class' : 'SimpleStrategy', 'replication_factor' : 1 }
    AND DURABLE_WRITES = true;

USE playground;

CREATE TYPE isis_permission (
     permittable_group_identifier text,
     allowed_operations set<text>
);

CREATE TYPE isis_permittable_group (
     path text,
     method text,
     source_group_id text
);

CREATE TYPE thoth_creditor (
     account_number text,
     amount double
);

CREATE TYPE thoth_debtor (
     account_number text,
     amount double
);

CREATE TABLE accounting_authorization_v1_data (
    "timestamp" text,
    application_private_key_exp varint,
    application_private_key_mod varint,
    application_public_key_exp varint,
    application_public_key_mod varint,
    identity_manager_public_key_exp varint,
    identity_manager_public_key_mod varint,
    valid boolean,
    PRIMARY KEY ("timestamp")
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
  AND id='031e6450-fcd0-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE INDEX accounting_authorization_v1_valid_index ON accounting_authorization_v1_data (valid);

CREATE TABLE accounting_cassandra_schema_table (
    version text,
    hash_value int,
    PRIMARY KEY (version)
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
  AND id='04bb2460-fcd0-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE TABLE cheques_authorization_v1_data (
    "timestamp" text,
    application_private_key_exp varint,
    application_private_key_mod varint,
    application_public_key_exp varint,
    application_public_key_mod varint,
    identity_manager_public_key_exp varint,
    identity_manager_public_key_mod varint,
    valid boolean,
    PRIMARY KEY ("timestamp")
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
  AND id='4c1ff790-fcd0-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE INDEX cheques_authorization_v1_valid_index ON cheques_authorization_v1_data (valid);

CREATE TABLE command_source (
    source text,
    bucket text,
    created_on timestamp,
    command text,
    failed boolean,
    failure_message text,
    processed boolean,
    PRIMARY KEY ((source, bucket), created_on)
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
  AND id='d94d96a0-fccf-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE TABLE customer_authorization_v1_data (
    "timestamp" text,
    application_private_key_exp varint,
    application_private_key_mod varint,
    application_public_key_exp varint,
    application_public_key_mod varint,
    identity_manager_public_key_exp varint,
    identity_manager_public_key_mod varint,
    valid boolean,
    PRIMARY KEY ("timestamp")
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
  AND id='2d8382c0-fcd0-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE INDEX customer_authorization_v1_valid_index ON customer_authorization_v1_data (valid);

CREATE TABLE deposit_authorization_v1_data (
    "timestamp" text,
    application_private_key_exp varint,
    application_private_key_mod varint,
    application_public_key_exp varint,
    application_public_key_mod varint,
    identity_manager_public_key_exp varint,
    identity_manager_public_key_mod varint,
    valid boolean,
    PRIMARY KEY ("timestamp")
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
  AND id='387924f0-fcd0-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE INDEX deposit_authorization_v1_valid_index ON deposit_authorization_v1_data (valid);

CREATE TABLE isis_application_callendpointsets (
    application_identifier text,
    call_endpoint_set_identifier text,
    call_endpoint_group_identifiers list<text>,
    PRIMARY KEY (application_identifier, call_endpoint_set_identifier)
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
  AND id='dd7c7340-fccf-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE TABLE isis_application_permission_users (
    application_identifier text,
    permittable_group_identifier text,
    user_identifier text,
    enabled boolean,
    PRIMARY KEY (application_identifier, permittable_group_identifier, user_identifier)
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
  AND id='dd57fb50-fccf-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE TABLE isis_application_permissions (
    application_identifier text,
    permittable_group_identifier text,
    "permission" frozen <isis_permission>,
    PRIMARY KEY (application_identifier, permittable_group_identifier)
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
  AND id='dd372ce0-fccf-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE TABLE isis_application_signatures (
    application_identifier text,
    key_timestamp text,
    public_key_exp varint,
    public_key_mod varint,
    PRIMARY KEY (application_identifier, key_timestamp)
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
  AND id='dd0fcec0-fccf-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE TABLE isis_permittable_groups (
    identifier text,
    permittables list<frozen <isis_permittable_group>>,
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
  AND id='dcb8ae10-fccf-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';


CREATE TABLE isis_roles (
    identifier text,
    "permissions" list<frozen <isis_permission>>,
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
  AND id='dce25620-fccf-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE TABLE isis_signatures (
    key_timestamp text,
    private_key_exp varint,
    private_key_mod varint,
    public_key_exp varint,
    public_key_mod varint,
    valid boolean,
    PRIMARY KEY (key_timestamp)
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
  AND id='dbe4e350-fccf-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE INDEX isis_signatures_valid_index ON isis_signatures (valid);

CREATE TABLE isis_tenant (
    version int,
    fixed_salt blob,
    password_expires_in_days int,
    time_to_change_password_after_expiration_in_days int,
    PRIMARY KEY (version)
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
  AND id='dc60ca10-fccf-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE TABLE isis_users (
    identifier text,
    iteration_count int,
    password_expires_on date,
    passwordword blob,
    roleidentifier text,
    salt blob,
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
  AND id='dc7f0070-fccf-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE TABLE office_authorization_v1_data (
    "timestamp" text,
    application_private_key_exp varint,
    application_private_key_mod varint,
    application_public_key_exp varint,
    application_public_key_mod varint,
    identity_manager_public_key_exp varint,
    identity_manager_public_key_mod varint,
    valid boolean,
    PRIMARY KEY ("timestamp")
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
  AND id='ef647ee0-fccf-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE INDEX office_authorization_v1_valid_index ON office_authorization_v1_data (valid);

CREATE TABLE payroll_authorization_v1_data (
    "timestamp" text,
    application_private_key_exp varint,
    application_private_key_mod varint,
    application_public_key_exp varint,
    application_public_key_mod varint,
    identity_manager_public_key_exp varint,
    identity_manager_public_key_mod varint,
    valid boolean,
    PRIMARY KEY ("timestamp")
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
  AND id='53954ca0-fcd0-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE INDEX payroll_authorization_v1_valid_index ON payroll_authorization_v1_data (valid);

CREATE TABLE portfolio_authorization_v1_data (
    "timestamp" text,
    application_private_key_exp varint,
    application_private_key_mod varint,
    application_public_key_exp varint,
    application_public_key_mod varint,
    identity_manager_public_key_exp varint,
    identity_manager_public_key_mod varint,
    valid boolean,
    PRIMARY KEY ("timestamp")
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
  AND id='16b160d0-fcd0-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE INDEX portfolio_authorization_v1_valid_index ON portfolio_authorization_v1_data (valid);

CREATE TABLE provisioner_authorization_v1_data (
    "timestamp" text,
    application_private_key_exp varint,
    application_private_key_mod varint,
    application_public_key_exp varint,
    application_public_key_mod varint,
    identity_manager_public_key_exp varint,
    identity_manager_public_key_mod varint,
    valid boolean,
    PRIMARY KEY ("timestamp")
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
  AND id='dddae6f0-fccf-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE INDEX provisioner_authorization_v1_valid_index ON provisioner_authorization_v1_data (valid);

CREATE TABLE reporting_authorization_v1_data (
    "timestamp" text,
    application_private_key_exp varint,
    application_private_key_mod varint,
    application_public_key_exp varint,
    application_public_key_mod varint,
    identity_manager_public_key_exp varint,
    identity_manager_public_key_mod varint,
    valid boolean,
    PRIMARY KEY ("timestamp")
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
  AND id='44ad3a90-fcd0-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE INDEX reporting_authorization_v1_valid_index ON reporting_authorization_v1_data (valid);


CREATE TABLE rhythm_authorization_v1_data (
    "timestamp" text,
    application_private_key_exp varint,
    application_private_key_mod varint,
    application_public_key_exp varint,
    application_public_key_mod varint,
    identity_manager_public_key_exp varint,
    identity_manager_public_key_mod varint,
    valid boolean,
    PRIMARY KEY ("timestamp")
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
  AND id='e246f3a0-fccf-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE INDEX rhythm_authorization_v1_valid_index ON rhythm_authorization_v1_data (valid);

CREATE TABLE teller_authorization_v1_data (
    "timestamp" text,
    application_private_key_exp varint,
    application_private_key_mod varint,
    application_public_key_exp varint,
    application_public_key_mod varint,
    identity_manager_public_key_exp varint,
    identity_manager_public_key_mod varint,
    valid boolean,
    PRIMARY KEY ("timestamp")
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
  AND id='400a8d80-fcd0-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE INDEX teller_authorization_v1_valid_index ON teller_authorization_v1_data (valid);

CREATE TABLE thoth_journal_entries (
    date_bucket text,
    transaction_identifier text,
    clerk text,
    created_by text,
    created_on timestamp,
    creditors set<frozen <thoth_creditor>>,
    debtors set<frozen <thoth_debtor>>,
    message text,
    note text,
    state text,
    transaction_date timestamp,
    transaction_type text,
    PRIMARY KEY (date_bucket, transaction_identifier)
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
  AND id='05174e20-fcd0-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';

CREATE TABLE thoth_journal_entry_lookup (
    transaction_identifier text,
    date_bucket text,
    PRIMARY KEY (transaction_identifier)
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
  AND id='0539ca40-fcd0-11e7-bb0b-6d2c86545d91'
  AND min_index_interval=128
  AND max_index_interval=2048
  AND memtable_flush_period_in_ms=0
  AND speculative_retry='99PERCENTILE';
