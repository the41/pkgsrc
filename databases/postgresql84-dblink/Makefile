# $NetBSD: Makefile,v 1.5 2011/10/12 19:46:42 hans Exp $

PKGNAME=	${DISTNAME:C/-/84-dblink-/}
COMMENT=	dblink module for remote database connections

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	postgresql84-server>=${PKGVERSION_NOREV}:../../databases/postgresql84-server

.include "../../databases/postgresql84/Makefile.common"

CONFIGURE_ARGS+=	--with-openssl
BUILD_MAKE_FLAGS=	PGXS=1
CFLAGS.SunOS+=		-D_POSIX_PTHREAD_SEMANTICS

BUILD_DIRS=		src/interfaces/libpq
BUILD_DIRS+=		contrib/dblink
INSTALL_DIRS=		contrib/dblink
REQD_DIRS+=		share/doc/postgresql/contrib
REQD_DIRS+=		share/postgresql/contrib

.include "../../databases/postgresql84-client/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
