# $NetBSD: Makefile,v 1.17 2009/12/12 19:19:00 asau Exp $
#

DISTNAME=	xlife-5.0
PKGREVISION=	5
CATEGORIES=	math games
MASTER_SITES=	http://www.catb.org/~esr/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.catb.org/~esr/software.html
COMMENT=	John Horton Conway's "Game of Life"

PKG_DESTDIR_SUPPORT=	user-destdir

WRKSRC=		${WRKDIR}
USE_IMAKE=	yes

pre-build:
	${TOUCH} ${WRKSRC}/collect.man ${WRKSRC}/lifesearchdumb.man

post-install:
.for d in codd life misc wireworld
	${INSTALL_DATA_DIR} ${DESTDIR}${PREFIX}/share/xlife/${d}
	cd ${WRKSRC}/${d}; for l in *.l; do				\
		${INSTALL_DATA} $${l} ${DESTDIR}${PREFIX}/share/xlife/${d};	\
	done
.endfor

.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
