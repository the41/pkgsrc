# $NetBSD: Makefile,v 1.4 2011/05/18 09:49:01 drochner Exp $
#

GST_PLUGINS0.10_NAME=	dvdread
GST_PLUGINS0.10_DIRS=	ext/dvdread

PKG_DESTDIR_SUPPORT=	user-destdir

.include "../../multimedia/gst-plugins0.10-ugly/Makefile.common"

.include "../../multimedia/libdvdread/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
