# $NetBSD: Makefile,v 1.61 2011/11/01 06:50:28 sbd Exp $

DISTNAME=	cmake-${CMAKE_API}.6
PKGREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	http://www.cmake.org/files/v2.8/

CMAKE_API=	2.8

MAINTAINER=	wiz@NetBSD.org
HOMEPAGE=	http://www.cmake.org/
COMMENT=	Cross platform make
LICENSE=	modified-bsd

PKG_DESTDIR_SUPPORT=	user-destdir

USE_TOOLS+=		gmake
USE_LANGUAGES=		c c++
# wants wsyncup and wcursyncup
USE_NCURSES=		yes
HAS_CONFIGURE=		yes
CONFIGURE_SCRIPT=	bootstrap

BUILD_TARGET=		default_target

CONFIGURE_HAS_MANDIR=	no
CONFIGURE_ARGS+=	--mandir=/${PKGMANDIR}
CONFIGURE_ARGS+=	--docdir=/share/doc/cmake-${CMAKE_API}
CONFIGURE_ARGS+=	--prefix=${PREFIX}
CONFIGURE_ARGS+=	--system-libs

.include "../../mk/bsd.prefs.mk"

.if !empty(MAKE_JOBS)
CONFIGURE_ARGS+=	--parallel=${MAKE_JOBS:Q}
.endif

PLIST_SUBST+=		CMAKE_API=${CMAKE_API}

# for Source/cmDependsJavaParser.cxx
UNLIMIT_RESOURCES=	datasize

# as of 2.4.6, x11 and fortran tests fail in pkgsrc
TEST_TARGET=		test

SUBST_CLASSES+=		cmake
SUBST_STAGE.cmake=	pre-configure
SUBST_MESSAGE.cmake=	Fixing LOCALBASE and X11 paths.
SUBST_FILES.cmake+=	Modules/FindX11.cmake
SUBST_FILES.cmake+=	Modules/Platform/UnixPaths.cmake
SUBST_VARS.cmake=	LOCALBASE X11BASE

SUBST_CLASSES+=		flags
SUBST_STAGE.flags=	pre-configure
SUBST_MESSAGE.flags=	Fixing compiler flags.
SUBST_FILES.flags=	Modules/Compiler/*.cmake
SUBST_SED.flags=	-e 's,-O.,,'

pre-configure:
	${RM} ${WRKSRC}/Modules/*.orig ${WRKSRC}/Modules/Platform/*.orig

BUILDLINK_API_DEPENDS.libarchive+=	libarchive>=2.8.4
.include "../../archivers/libarchive/buildlink3.mk"
.include "../../devel/ncurses/buildlink3.mk"
.include "../../devel/zlib/buildlink3.mk"
.include "../../textproc/expat/buildlink3.mk"
.include "../../textproc/xmlrpc-c/buildlink3.mk"
.include "../../www/curl/buildlink3.mk"

.include "../../mk/bsd.pkg.mk"
