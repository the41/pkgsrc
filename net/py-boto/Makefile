# $NetBSD: Makefile,v 1.12 2011/10/31 11:36:00 obache Exp $
#

DISTNAME=	boto-1.9b
PKGREVISION=	1
PKGNAME=	${PYPKGPREFIX}-${DISTNAME}
CATEGORIES=	net
MASTER_SITES=	http://boto.googlecode.com/files/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://boto.googlecode.com/
COMMENT=	Python interface to Amazon web services
LICENSE=	mit

PKG_DESTDIR_SUPPORT=	user-destdir

PYTHON_VERSIONS_ACCEPTED= 27 26 25

REPLACE_PYTHON+=	boto/*/*.py

.include "../../lang/python/application.mk"
.include "../../lang/python/egg.mk"
.include "../../mk/bsd.pkg.mk"
