# $NetBSD: Makefile,v 1.19 2008/06/20 01:09:12 joerg Exp $

DISTNAME=	c_cpp_reference-2.0.2
PKGNAME=	${DISTNAME:S/_/-/g}
PKGREVISION=	7
CATEGORIES=	devel kde
MASTER_SITES=	ftp://ftp.e-technik.fh-muenchen.de/pub/unix/ide/KDevelop/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.kdevelop.org/
COMMENT=	C and C++ reference for the KDE IDE

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	kdevelop-base>=3.1.0:../../devel/kdevelop-base

USE_TOOLS+=	gmake
USE_LIBTOOL=	YES
GNU_CONFIGURE=	YES

INSTALLATION_DIRS=	share/kde/apps/kdevdocumentation/tocs

post-build:
	${SED} -e 's,@PREFIX@,${PREFIX},g'			\
	< ${FILESDIR}/c_reference.toc > ${WRKDIR}/c_reference.toc
	${SED} -e 's,@PREFIX@,${PREFIX},g'			\
	< ${FILESDIR}/c++_reference.toc > ${WRKDIR}/c++_reference.toc

post-install:
	${INSTALL_DATA} ${WRKDIR}/c_reference.toc ${DESTDIR}${PREFIX}/share/kde/apps/kdevdocumentation/tocs/c_reference.toc
	${INSTALL_DATA} ${WRKDIR}/c++_reference.toc ${DESTDIR}${PREFIX}/share/kde/apps/kdevdocumentation/tocs/c++_reference.toc

.include "../../meta-pkgs/kde3/kde3.mk"
.include "../../mk/bsd.pkg.mk"
