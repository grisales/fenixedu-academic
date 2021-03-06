/**
 * Copyright © 2002 Instituto Superior Técnico
 *
 * This file is part of FenixEdu Academic.
 *
 * FenixEdu Academic is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * FenixEdu Academic is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with FenixEdu Academic.  If not, see <http://www.gnu.org/licenses/>.
 */
package org.fenixedu.academic.domain.accounting.paymentPlans;

import java.util.Collection;
import java.util.Collections;

import org.fenixedu.academic.domain.ExecutionYear;
import org.fenixedu.academic.domain.accounting.paymentPlanRules.FirstTimeInstitutionStudentsPaymentPlanRule;
import org.fenixedu.academic.domain.accounting.paymentPlanRules.PaymentPlanRule;
import org.fenixedu.academic.domain.accounting.paymentPlanRules.PaymentPlanRuleFactory;
import org.fenixedu.academic.domain.accounting.serviceAgreementTemplates.DegreeCurricularPlanServiceAgreementTemplate;

public class FullGratuityPaymentPlanForFirstTimeInstitutionStudents extends
        FullGratuityPaymentPlanForFirstTimeInstitutionStudents_Base {

    private FullGratuityPaymentPlanForFirstTimeInstitutionStudents() {
        super();
    }

    public FullGratuityPaymentPlanForFirstTimeInstitutionStudents(final ExecutionYear executionYear,
            final DegreeCurricularPlanServiceAgreementTemplate serviceAgreementTemplate, final Boolean defaultPlan) {
        this();
        super.init(executionYear, serviceAgreementTemplate, defaultPlan);
    }

    @Override
    protected Collection<PaymentPlanRule> getSpecificPaymentPlanRules() {
        return Collections.singleton(PaymentPlanRuleFactory.create(FirstTimeInstitutionStudentsPaymentPlanRule.class));
    }

    @Override
    final public boolean isForFirstTimeInstitutionStudents() {
        return true;
    }

}
