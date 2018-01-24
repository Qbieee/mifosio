USE seshat;
  COPY applications from 'cql/seshat-data/applications.csv';
  COPY clients from 'cql/seshat-data/clients.csv';
  COPY config from 'cql/seshat-data/config.csv';
  COPY tenant_applications from 'cql/seshat-data/tenant_applications.csv';
  COPY tenants from 'cql/seshat-data/tenants.csv';
  COPY users from 'cql/seshat-data/users.csv' with NULL = 'null';
