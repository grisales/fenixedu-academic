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
package net.sourceforge.fenixedu.domain.degreeStructure;

import java.util.ResourceBundle;

import org.fenixedu.commons.i18n.I18N;

public class NullEctsComparabilityPercentages extends EctsComparabilityPercentages {
    private static final long serialVersionUID = -929489243618382282L;

    public NullEctsComparabilityPercentages() {
        super(new double[0]);
    }

    @Override
    public double getPercentage(int grade) {
        return -1;
    }

    @Override
    public String getPrintableFormat() {
        return ResourceBundle.getBundle("resources.GEPResources", I18N.getLocale()).getString(
                "label.ects.table.nullPrintFormat");
    }

    @Override
    public String toString() {
        return "";
    }

}