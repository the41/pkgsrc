# $NetBSD: Makefile,v 1.12 2011/11/01 06:00:40 sbd Exp $
#

DISTNAME=	pavumeter-0.9.3
PKGREVISION=	9
CATEGORIES=	audio
MASTER_SITES=	http://0pointer.de/lennart/projects/pavumeter/

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://0pointer.de/lennart/projects/pavumeter/
COMMENT=	Volume meter for the PulseAudio sound server

GNU_CONFIGURE=	yes
USE_LANGUAGES=	c c++
USE_TOOLS+=	pkg-config gmake intltool perl

CONFIGURE_ARGS+=	--disable-lynx

PKG_DESTDIR_SUPPORT=  user-destdir

.include "../../audio/libcanberra/buildlink3.mk"
.include "../../audio/pulseaudio/buildlink3.mk"
.include "../../converters/libiconv/buildlink3.mk"
.include "../../devel/gconfmm/buildlink3.mk"
.include "../../devel/libglademm/buildlink3.mk"
.include "../../devel/libsigc++/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/gtkmm/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
