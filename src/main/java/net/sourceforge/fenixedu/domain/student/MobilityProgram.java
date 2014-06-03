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
package net.sourceforge.fenixedu.domain.student;

import java.util.Locale;
import java.util.ResourceBundle;

import net.sourceforge.fenixedu.domain.organizationalStructure.UniversityUnit;
import net.sourceforge.fenixedu.util.BundleUtil;

import org.fenixedu.commons.i18n.I18N;

public enum MobilityProgram {

    SOCRATES,

    ERASMUS,

    MINERVA,

    COVENANT_WITH_AZORES,

    COVENANT_WITH_INSTITUTION {

        @Override
        protected String getSpecificDescription(final Locale locale) {
            return ResourceBundle.getBundle(BundleUtil.ENUMERATION_BUNDLE, I18N.getLocale()).getString(getQualifiedName())
                    + UniversityUnit.getInstitutionsUniversityUnit().getName();
        }

    };

    public String getQualifiedName() {
        Class<?> enumClass = this.getClass();
        if (!enumClass.isEnum() && Enum.class.isAssignableFrom(enumClass)) {
            enumClass = enumClass.getEnclosingClass();
        }

        return enumClass.getSimpleName() + "." + name();
    }

    protected String getSpecificDescription(final Locale locale) {
        return ResourceBundle.getBundle(BundleUtil.ENUMERATION_BUNDLE, locale).getString(getQualifiedName());
    }

    public String getDescription() {
        return getSpecificDescription(I18N.getLocale());
    }

    public String getDescription(final Locale locale) {
        return getSpecificDescription(locale);
    }

}