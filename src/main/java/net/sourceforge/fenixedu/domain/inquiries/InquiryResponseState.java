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
/**
 * 
 */
package net.sourceforge.fenixedu.domain.inquiries;

import java.util.ResourceBundle;

import net.sourceforge.fenixedu.util.BundleUtil;

import org.fenixedu.commons.i18n.I18N;

import pt.ist.fenixWebFramework.rendererExtensions.util.IPresentableEnum;

/**
 * @author - Ricardo Rodrigues (ricardo.rodrigues@ist.utl.pt)
 * 
 */
public enum InquiryResponseState implements IPresentableEnum {

    COMPLETE, PARTIALLY_FILLED, INCOMPLETE, EMPTY;

    @Override
    public String getLocalizedName() {
        final ResourceBundle bundle = ResourceBundle.getBundle(BundleUtil.ENUMERATION_BUNDLE, I18N.getLocale());
        return bundle.getString(this.getClass().getName() + "." + name());
    }
}