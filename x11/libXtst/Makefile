# $NetBSD: Makefile,v 1.7 2010/10/12 19:34:00 minskim Exp $
#

DISTNAME=		libXtst-1.1.0
CATEGORIES=		x11 devel
MASTER_SITES=		${MASTER_SITE_XORG:=lib/}
EXTRACT_SUFX=		.tar.bz2

MAINTAINER=		joerg@NetBSD.org
HOMEPAGE=		http://xorg.freedesktop.org/
COMMENT=		X Tst Library

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LIBTOOL=		yes
GNU_CONFIGURE=		yes
USE_TOOLS+=		pkg-config

PKGCONFIG_OVERRIDE+=	xtst.pc.in

CONFIGURE_ENV+=		ac_cv_path_XMLTO=	# empty

.include "../../x11/inputproto/buildlink3.mk"
BUILDLINK_API_DEPENDS.recordproto+=	recordproto>=1.13.99.1
.include "../../x11/recordproto/buildlink3.mk"
BUILDLINK_API_DEPENDS.xextproto+=	xextproto>=7.0.99.3
.include "../../x11/xextproto/buildlink3.mk"
.include "../../x11/libX11/buildlink3.mk"
BUILDLINK_API_DEPENDS.libXext+=		libXext>=1.0.99.4
.include "../../x11/libXext/buildlink3.mk"
.include "../../x11/libXi/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
