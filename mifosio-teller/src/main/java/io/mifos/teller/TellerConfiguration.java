/*
 * Copyright 2017 The Mifos Initiative.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package io.mifos.teller;

import io.mifos.accounting.api.v1.client.LedgerManager;
import io.mifos.anubis.config.EnableAnubis;
import io.mifos.cheque.api.v1.client.ChequeManager;
import io.mifos.core.async.config.EnableAsync;
import io.mifos.core.cassandra.config.EnableCassandra;
import io.mifos.core.command.config.EnableCommandProcessing;
import io.mifos.core.lang.config.EnableServiceException;
import io.mifos.core.lang.config.EnableTenantContext;
import io.mifos.core.mariadb.config.EnableMariaDB;
import io.mifos.deposit.api.v1.client.DepositAccountManager;
import io.mifos.office.api.v1.client.OrganizationManager;
import io.mifos.portfolio.api.v1.client.PortfolioManager;
import io.mifos.tool.crypto.config.EnableCrypto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.servlet.config.annotation.PathMatchConfigurer;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

@SuppressWarnings("WeakerAccess")
@Configuration
@EnableAutoConfiguration
@EnableDiscoveryClient
@EnableAsync
@EnableTenantContext
@EnableCassandra
@EnableMariaDB
@EnableCommandProcessing
@EnableAnubis
@EnableServiceException
@EnableCrypto
@EnableFeignClients(
    clients = {
        OrganizationManager.class,
        LedgerManager.class,
        DepositAccountManager.class,
        PortfolioManager.class,
        ChequeManager.class
    }
)
@ComponentScan({
    "io.mifos.teller.service.rest",
    "io.mifos.teller.service.internal.service",
    "io.mifos.teller.service.internal.repository",
    "io.mifos.teller.service.internal.command.handler",
    "io.mifos.teller.service.internal.processor"
})
@EnableJpaRepositories({
    "io.mifos.teller.service.internal.repository"
})
public class TellerConfiguration extends WebMvcConfigurerAdapter {

  public TellerConfiguration() {
    super();
  }

  @Bean(name = ServiceConstants.LOGGER_NAME)
  public Logger logger() {
    return LoggerFactory.getLogger(ServiceConstants.LOGGER_NAME);
  }

  @Override
  public void configurePathMatch(final PathMatchConfigurer configurer) {
    configurer.setUseSuffixPatternMatch(Boolean.FALSE);
  }
}
