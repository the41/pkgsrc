# $NetBSD: Makefile,v 1.14 2009/07/07 18:53:17 joerg Exp $
#

DISTNAME=	cgi.tcl
PKGNAME=	tcl-cgi-1.3.0
CATEGORIES=	www
MASTER_SITES=	${MASTER_SITE_BACKUP}

MAINTAINER=	bouyer@NetBSD.org
HOMEPAGE=	http://expect.nist.gov/cgi.tcl/
COMMENT=	Library of Tcl procedures to assist in writing CGI scripts

PKG_DESTDIR_SUPPORT=	user-destdir

DEPENDS+=	tcl>=8.3.2:../../lang/tcl

WRKSRC=		${WRKDIR}/cgi.tcl-1.3
DIST_SUBDIR=	${PKGNAME_NOREV}

GNU_CONFIGURE=	yes

INSTALLATION_DIRS=	share/doc/tcl/cgi-tcl share/examples/tcl/cgi-tcl

post-install:
	${INSTALL_DATA} ${WRKSRC}/doc/* ${DESTDIR}${PREFIX}/share/doc/tcl/cgi-tcl
	${INSTALL_DATA} ${WRKSRC}/example/* ${DESTDIR}${PREFIX}/share/examples/tcl/cgi-tcl

.include "../../mk/bsd.pkg.mk"
