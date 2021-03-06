# $NetBSD: Makefile,v 1.31.2.1 2012/01/17 22:40:37 tron Exp $

DISTNAME=	kdebase-workspace-${_KDE_VERSION}
PKGREVISION=	5
CATEGORIES=	x11
COMMENT=	base workspace for the KDE 4 integrated X11 desktop

.include "../../meta-pkgs/kde4/Makefile.kde4"

DISTFILES=	${DEFAULT_DISTFILES} Daemon.png Daemon.README
DISTFILES+=	NetBSD-flag-1.0.png
SITES.Daemon.png=	${MASTER_SITE_LOCAL}
SITES.Daemon.README=	${MASTER_SITE_LOCAL}
SITES.NetBSD-flag-1.0.png=	${MASTER_SITE_LOCAL}

EXTRACT_ONLY=	${DISTNAME}${EXTRACT_SUFX}

# BUILD_MAKE_FLAGS+= VERBOSE=1

USE_TOOLS+=		mkfontdir bdftopcf gmake

FONTS_DIRS.x11+=	${PREFIX}/share/kde/fonts/override
REQD_DIRS+=		${PREFIX}/share/kde/fonts
REQD_DIRS+=		${PREFIX}/share/kde/fonts/override

RCD_SCRIPTS=		kdm

CONF_FILES=		${PREFIX}/share/kde/config/kdm/kdmrc \
			${PKG_SYSCONFDIR}/kdm/kdmrc
OWN_DIRS=		${PKG_SYSCONFDIR}/kdm

CONF_FILES+=		${PREFIX}/share/examples/kdebase-workspace4/ksysguarddrc \
			${PKG_SYSCONFDIR}/ksysguarddrc
CONF_FILES+=		${PREFIX}/share/examples/kde4-dbus/org.kde.ksysguard.processlisthelper.conf \
			${PKG_SYSCONFDIR}/dbus-1/system.d/org.kde.ksysguard.processlisthelper.conf
CONF_FILES+=		${PREFIX}/share/examples/kde4-dbus/org.kde.fontinst.conf \
			${PKG_SYSCONFDIR}/dbus-1/system.d/org.kde.fontinst.conf
CONF_FILES+=		${PREFIX}/share/examples/kde4-dbus/org.kde.kcontrol.kcmclock.conf \
			${PKG_SYSCONFDIR}/dbus-1/system.d/org.kde.kcontrol.kcmclock.conf

SPECIAL_PERMS+=		${PREFIX}/lib/kde4/libexec/kcheckpass \
			${REAL_ROOT_USER} ${REAL_ROOT_GROUP} 6555

REPLACE_PERL+= \
	kcontrol/keys/convertShortcuts.pl \
	kwin/data/kwin3_plugin.pl \
	kwin/data/pluginlibFix.pl

PY_PATCHPLIST=	yes

.include "../../mk/bsd.prefs.mk"
.include "options.mk"

SUBST_CLASSES+=		paths qtpath isocodes
SUBST_FILES.paths=	kcontrol/kdm/main.cpp
SUBST_SED.paths=	-e 's,@PKG_SYSCONFDIR@,${PKG_SYSCONFDIR},g'
SUBST_STAGE.paths=	post-patch

SUBST_FILES.qtpath=	startkde.cmake
SUBST_VARS.qtpath=	QTDIR
SUBST_STAGE.qtpath=	post-patch

SUBST_FILES.isocodes=	kcontrol/keyboard/iso_codes.h
SUBST_SED.isocodes=	-e 's,/usr/share/xml/iso-codes,${BUILDLINK_PREFIX.iso-codes}/share/xml/iso-codes,g'
SUBST_STAGE.isocodes=	post-patch

ICONDIR=		share/icons

.include "../../mk/bsd.prefs.mk"
.if ${OPSYS} == "NetBSD" && exists(/usr/include/sys/pset.h)
RT_LIB_SCHED=	rt
.else
RT_LIB_SCHED=	# empty
.endif
CMAKE_ARGS+=	-DRT_LIB_SCHED=${RT_LIB_SCHED}
CMAKE_ARGS+=	-DWITH_Xmms:BOOL=OFF

# genkdmconf wont install faces if using destdir so do it ourselves
INSTALLATION_DIRS+= share/kde/apps/kdm/faces

post-install:
	${INSTALL_DATA} ${WRKSRC}/kdm/kfrontend/pics/default1.png \
		${DESTDIR}${PREFIX}/share/kde/apps/kdm/faces/.default.face.icon
	${INSTALL_DATA} ${WRKSRC}/kdm/kfrontend/pics/root1.png \
		${DESTDIR}${PREFIX}/share/kde/apps/kdm/faces/root.face.icon
	${INSTALL_DATA} ${DISTDIR}/NetBSD-flag-1.0.png \
		${DESTDIR}${PREFIX}/${ICONDIR}/NetBSD-flag.png
	${INSTALL_DATA} ${DISTDIR}/Daemon.png ${DESTDIR}${PREFIX}/${ICONDIR}
	${INSTALL_DATA} ${DISTDIR}/Daemon.README \
		${DESTDIR}${PREFIX}/share/doc/kde/HTML/en/kdm
.if ${OPSYS} == "NetBSD"
	@# NetBSD Advertisement O:-)
	cd ${DESTDIR}${PREFIX}/share/kde/config/kdm;			\
	${SED} -e 's|^\(LogoPixmap\)=.*|\1=${PREFIX}/${ICONDIR}/NetBSD-flag.png|' \
                kdmrc > ${WRKDIR}/kdmrc.ad;				\
	${CP} -f ${WRKDIR}/kdmrc.ad kdmrc
.endif

BUILDLINK_DEPMETHOD.qt4-tools=	full
.include "../../meta-pkgs/kde4/kde4.mk"

PYTHON_VERSIONS_ACCEPTED= 27 26 25 # because kdebindings4-python
.include "../../lang/python/application.mk"
.include "../../lang/python/extension.mk"
.include "../../devel/libusb/buildlink3.mk"
.include "../../graphics/hicolor-icon-theme/buildlink3.mk"
.include "../../graphics/qimageblitz/buildlink3.mk"
.include "../../security/polkit-qt/buildlink3.mk"
# not yet - causes kdm logins to fail, presumably because
#  I don't know how consolekit works
#.include "../../sysutils/consolekit/buildlink3.mk"
.include "../../sysutils/desktop-file-utils/desktopdb.mk"
.include "../../textproc/iso-codes/buildlink3.mk"
.include "../../x11/kdebindings4-python/buildlink3.mk"
.include "../../x11/kdelibs4/buildlink3.mk"
.include "../../misc/kdepimlibs4/buildlink3.mk"
.include "../../x11/libxklavier/buildlink3.mk"
.include "../../x11/libXcomposite/buildlink3.mk"
.include "../../x11/libXdamage/buildlink3.mk"
.include "../../x11/libXi/buildlink3.mk"
.include "../../x11/libXres/buildlink3.mk"
.include "../../x11/libXxf86misc/buildlink3.mk"
.include "../../x11/libXScrnSaver/buildlink3.mk"

.include "../../mk/pam.buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
