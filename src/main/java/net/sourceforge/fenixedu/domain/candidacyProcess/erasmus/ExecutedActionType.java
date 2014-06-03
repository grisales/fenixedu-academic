/**
 * Copyright © 2002 Instituto Superior Técnico
 *
 * This file is part of FenixEdu Core.
 *
 * FenixEdu Core is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * FenixEdu Core is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with FenixEdu Core.  If not, see <http://www.gnu.org/licenses/>.
 */
package net.sourceforge.fenixedu.domain.candidacyProcess.erasmus;

import java.util.Locale;
import java.util.ResourceBundle;

import org.fenixedu.commons.i18n.I18N;

public enum ExecutedActionType {
    VIEWED_APPROVED_LEARNING_AGREEMENT, SENT_APPROVED_LEARNING_AGREEMENT, VIEWED_ALERT, SENT_EMAIL_ACCEPTED_STUDENT,
    SENT_EMAIL_FOR_MISSING_REQUIRED_DOCUMENTS, SENT_RECEPTION_EMAIL;

    public String getLocalizedName() {
        return getLocalizedName(I18N.getLocale());
    }

    public String getLocalizedName(final Locale locale) {
        return ResourceBundle.getBundle("resources.CandidateResources", locale).getString(getQualifiedName());
    }

    public String getQualifiedName() {
        return getClass().getSimpleName() + "." + name();
    }

}