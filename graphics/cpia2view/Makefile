# $NetBSD: Makefile,v 1.20 2011/04/22 13:43:42 obache Exp $
#

DISTNAME=	cpia2_driver-1.0
PKGNAME=	cpia2view-0.03
PKGREVISION=	10
CATEGORIES=	graphics x11
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=cpia2/}
EXTRACT_SUFX=	.tgz

PATCH_SITES=	http://home.384.jp/takam/bsd/
PATCHFILES=	cpia2_driver-1.0-bsd-0.03.patch.gz
PATCH_DIST_STRIP=	-p1

MAINTAINER=	hamajima@NetBSD.org
HOMEPAGE=	http://home.384.jp/takam/bsd/NetBSD.html#cpia2
COMMENT=	USB cameras based CPiA2 Utility Programs

PKG_DESTDIR_SUPPORT=	user-destdir

USE_BSD_MAKEFILE=	yes
USE_TOOLS+=		groff nroff

INSTALLATION_DIRS=	bin ${PKGMANDIR}/cat1 ${PKGMANDIR}/man1

.include "../../mk/bsd.prefs.mk"

do-build:
	for f in cpia2shot cpia2view ; do		\
		cd ${WRKSRC} && ${SETENV} ${MAKE_ENV}	\
		NOGCCERROR=				\
		${MAKE_PROGRAM} -f ${MAKE_FILE}.$$f ;	\
	done

do-install:
	for f in cpia2shot cpia2view ; do			\
		cd ${WRKSRC} && ${SETENV} ${INSTALL_ENV} ${MAKE_ENV}	\
		${MAKE_PROGRAM} -f ${MAKE_FILE}.$$f install ;	\
	done

.include "../../graphics/imlib-gtk/buildlink3.mk"
.include "../../x11/gtk/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
