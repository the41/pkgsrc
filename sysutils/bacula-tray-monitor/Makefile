# $NetBSD: Makefile,v 1.20 2011/11/01 06:02:31 sbd Exp $

PKGNAME=	${DISTNAME:S/-/-tray-monitor-/}
PKGREVISION=	3
COMMENT=	System tray monitor for Bacula - The Network Backup Solution

PKG_DESTDIR_SUPPORT=	user-destdir

DISTINFO_FILE=		${.CURDIR}/../../sysutils/bacula/distinfo
PATCHDIR=		${.CURDIR}/../../sysutils/bacula/patches

USE_TOOLS+=		pkg-config
CONFIGURE_ARGS+=	--enable-client-only
CONFIGURE_ARGS+=	--enable-tray-monitor

BUILD_DIRS=		src/lib
BUILD_DIRS+=		src/tray-monitor
INSTALL_DIRS=		src/tray-monitor

INSTALLATION_DIRS=	sbin share/examples/bacula

.include "../../sysutils/bacula/Makefile.common"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
