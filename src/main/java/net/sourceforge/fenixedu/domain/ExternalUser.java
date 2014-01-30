package net.sourceforge.fenixedu.domain;

import org.apache.commons.codec.digest.DigestUtils;
import org.fenixedu.bennu.core.domain.Bennu;

public class ExternalUser extends ExternalUser_Base {

    public ExternalUser() {
        super();
        setRootDomainObject(Bennu.getInstance());
    }

    public ExternalUser(final String username, final String password) {
        this();
        setUsername(username);
        final String hash = hash(password);
        setPasswordHash(hash);
    }

    private String hash(final String password) {
        return DigestUtils.shaHex(password);
    }

    public boolean verify(final String username, final String password) {
        return username.equals(getUsername()) && hash(password).equals(getPasswordHash());
    }

    @Deprecated
    public boolean hasBennu() {
        return getRootDomainObject() != null;
    }

    @Deprecated
    public boolean hasPasswordHash() {
        return getPasswordHash() != null;
    }

    @Deprecated
    public boolean hasUsername() {
        return getUsername() != null;
    }

    public static final boolean isExternalUser(final String username) {
        for (final ExternalUser externalUser : Bennu.getInstance().getExternalUserSet()) {
            if (externalUser.getUsername().equals(username)) {
                return true;
            }
        }
        return false;
    }
}