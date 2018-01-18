/*
 * Copyright 2017 Kuelap, Inc.
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
package io.mifos.individuallending.internal.command;

import io.mifos.individuallending.api.v1.domain.product.LossProvisionConfiguration;

/**
 * @author Myrle Krantz
 */
public class ChangeLossProvisionSteps {
  private final String productIdentifier;
  private final LossProvisionConfiguration lossProvisionConfiguration;

  public ChangeLossProvisionSteps(String productIdentifier, LossProvisionConfiguration lossProvisionConfiguration) {
    this.productIdentifier = productIdentifier;
    this.lossProvisionConfiguration = lossProvisionConfiguration;
  }

  public String getProductIdentifier() {
    return productIdentifier;
  }

  public LossProvisionConfiguration getLossProvisionConfiguration() {
    return lossProvisionConfiguration;
  }

  @Override
  public String toString() {
    return "ChangeLossProvisionSteps{" +
        "productIdentifier='" + productIdentifier + '\'' +
        ", lossProvisionConfiguration=" + lossProvisionConfiguration +
        '}';
  }
}
