# $NetBSD: Makefile,v 1.54 2011/12/06 23:40:07 marino Exp $

DISTNAME=		rapidsvn-0.12.0-1
PKGNAME=		${DISTNAME:S/-1$/.1/}
CATEGORIES=		devel x11 scm
MASTER_SITES=		http://rapidsvn.org/download/release/0.12/

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://rapidsvn.tigris.org/
COMMENT=		Cross-platform Subversion GUI
LICENSE=		gnu-gpl-v3

PKG_DESTDIR_SUPPORT=	user-destdir

USE_TOOLS+=		gmake msgfmt
USE_LANGUAGES=		c c++
USE_LIBTOOL=		YES
GNU_CONFIGURE=		YES

CONFIGURE_ARGS+=	--with-svn-include=${BUILDLINK_DIR}/include
CONFIGURE_ARGS+=	--with-svn-lib=${BUILDLINK_DIR}/lib

# While apr is actually a dependency, we ride it being included via
# subversion-base, following the precedent of devel/foo-subversion and
# www/ap2-subversion.
.include "../../devel/subversion-base/buildlink3.mk"
.include "../../x11/wxGTK28/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
