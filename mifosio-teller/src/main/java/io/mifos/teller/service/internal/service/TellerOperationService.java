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
package io.mifos.teller.service.internal.service;

import io.mifos.core.lang.ServiceException;
import io.mifos.teller.ServiceConstants;
import io.mifos.teller.api.v1.domain.TellerTransaction;
import io.mifos.teller.service.internal.mapper.ChequeMapper;
import io.mifos.teller.service.internal.mapper.TellerTransactionMapper;
import io.mifos.teller.service.internal.repository.ChequeEntity;
import io.mifos.teller.service.internal.repository.ChequeRepository;
import io.mifos.teller.service.internal.repository.TellerEntity;
import io.mifos.teller.service.internal.repository.TellerRepository;
import io.mifos.teller.service.internal.repository.TellerTransactionEntity;
import io.mifos.teller.service.internal.repository.TellerTransactionRepository;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;


@Service
public class TellerOperationService {

  private final Logger logger;
  private final TellerRepository tellerRepository;
  private final TellerTransactionRepository tellerTransactionRepository;
  private final ChequeRepository chequeRepository;

  @Autowired
  public TellerOperationService(@Qualifier(ServiceConstants.LOGGER_NAME) final Logger logger,
                                final TellerRepository tellerRepository,
                                final TellerTransactionRepository tellerTransactionRepository,
                                final ChequeRepository chequeRepository) {
    super();
    this.logger = logger;
    this.tellerRepository = tellerRepository;
    this.tellerTransactionRepository = tellerTransactionRepository;
    this.chequeRepository = chequeRepository;
  }

  public Optional<TellerTransaction> getTellerTransaction(final String tellerTransactionIdentifier) {

    final Optional<TellerTransactionEntity> optionalTellerTransaction =
        this.tellerTransactionRepository.findByIdentifier(tellerTransactionIdentifier);

    return optionalTellerTransaction.map(tellerTransactionEntity -> {
      final TellerTransaction tellerTransaction = TellerTransactionMapper.map(tellerTransactionEntity);
      if (tellerTransaction.getTransactionType().equals(ServiceConstants.TX_CHEQUE)) {
        final Optional<ChequeEntity> optionalCheque =
            this.chequeRepository.findByTellerTransactionId(tellerTransactionEntity.getId());

        optionalCheque.ifPresent(chequeEntity -> tellerTransaction.setCheque(ChequeMapper.map(chequeEntity)));
      }
      return tellerTransaction;
    });
  }

  public List<TellerTransaction> fetchTellerTransactions(final String tellerCode, final String state) {
    final Optional<TellerEntity> optionalTellerEntity = this.tellerRepository.findByIdentifier(tellerCode);
    if (optionalTellerEntity.isPresent()) {
      final TellerEntity tellerEntity = optionalTellerEntity.get();
      if (state != null) {
        return this.tellerTransactionRepository.findByTellerAndStateOrderByTransactionDateAsc(tellerEntity, state)
            .stream()
            .map(tellerTransactionEntity -> {
              final TellerTransaction tellerTransaction = TellerTransactionMapper.map(tellerTransactionEntity);
              if (tellerTransaction.getTransactionType().equals(ServiceConstants.TX_CHEQUE)) {
                final Optional<ChequeEntity> optionalCheque =
                    this.chequeRepository.findByTellerTransactionId(tellerTransactionEntity.getId());

                optionalCheque.ifPresent(chequeEntity -> tellerTransaction.setCheque(ChequeMapper.map(chequeEntity)));
              }
              return tellerTransaction;
            })
            .collect(Collectors.toList());
      } else {
        return this.tellerTransactionRepository.findByTellerOrderByTransactionDateAsc(tellerEntity)
            .stream()
            .map(tellerTransactionEntity -> {
              final TellerTransaction tellerTransaction = TellerTransactionMapper.map(tellerTransactionEntity);
              if (tellerTransaction.getTransactionType().equals(ServiceConstants.TX_CHEQUE)) {
                final Optional<ChequeEntity> optionalCheque =
                    this.chequeRepository.findByTellerTransactionId(tellerTransactionEntity.getId());

                optionalCheque.ifPresent(chequeEntity -> tellerTransaction.setCheque(ChequeMapper.map(chequeEntity)));
              }
              return tellerTransaction;
            })
            .collect(Collectors.toList());
      }
    } else {
      throw ServiceException.notFound("Teller {0} not found.", tellerCode);
    }
  }
}
