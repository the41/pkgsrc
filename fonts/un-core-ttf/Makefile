# $NetBSD: Makefile,v 1.6 2008/12/21 00:25:00 minskim Exp $

DISTNAME=	un-fonts-core-1.0.2-080608
PKGNAME=	${DISTNAME:S/fonts-core/core-ttf/:S/-0/.200/}
CATEGORIES=	fonts korean
MASTER_SITES=	http://kldp.net/frs/download.php/4695/

MAINTAINER=	yui@yui.pe.kr
HOMEPAGE=	http://kldp.net/projects/unfonts/
COMMENT=	Core set of Un Korean TrueType fonts

CONFLICTS+=	un-ttf-[0-9]*

PKG_DESTDIR_SUPPORT=	user-destdir

WRKSRC=		${WRKDIR}/un-fonts
USE_X11BASE=	yes
NO_CONFIGURE=	yes
NO_BUILD=	yes

FONTS_DIRS.ttf=	${PREFIX}/lib/X11/fonts/TTF

do-install:
	${INSTALL_DATA_DIR} ${DESTDIR}${FONTS_DIRS.ttf}
	${INSTALL_DATA} ${WRKSRC}/*.ttf ${DESTDIR}${FONTS_DIRS.ttf}

.include "../../mk/bsd.pkg.mk"
