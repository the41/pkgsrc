# $NetBSD: Makefile,v 1.4 2011/04/22 13:41:58 obache Exp $
#

DISTNAME=	pakchois-0.4
PKGREVISION=	1
CATEGORIES=	security
MASTER_SITES=	http://www.manyfish.co.uk/pakchois/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.manyfish.co.uk/pakchois/
COMMENT=	PKCS\#11 wrapper library

PKG_DESTDIR_SUPPORT=	user-destdir

GNU_CONFIGURE=	yes
USE_LIBTOOL=	yes
USE_TOOLS+=	gmake pkg-config

PKGCONFIG_OVERRIDE+=	pakchois.pc.in

PTHREAD_OPTS+=		require
PKG_PTHREAD_FLAGS=	${PTHREAD_LDFLAGS} ${PTHREAD_LIBS}

BROKEN_GETTEXT_DETECTION=	yes
BUILDLINK_TRANSFORM+=	opt:-ldl:${BUILDLINK_LDADD.dl:M*}
BUILDLINK_TRANSFORM+=	opt:-lpthread:${PKG_PTHREAD_FLAGS:M*}

.include "../../devel/gettext-lib/buildlink3.mk"
.include "../../mk/dlopen.buildlink3.mk"
.include "../../mk/pthread.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
