# $NetBSD: Makefile,v 1.42 2011/11/07 13:10:31 hans Exp $

DISTNAME=	libtorrent-0.12.9
CATEGORIES=	net
MASTER_SITES=	${HOMEPAGE:=downloads/}

OWNER=		tron@NetBSD.org
HOMEPAGE=	http://libtorrent.rakshasa.no/
COMMENT=	BitTorrent library written in C++ for *nix
LICENSE=	gnu-gpl-v2

PKG_DESTDIR_SUPPORT=	user-destdir

USE_LANGUAGES=		c c++
USE_LIBTOOL=		yes
USE_TOOLS+=		gmake pkg-config
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--disable-debug

.include "../../mk/bsd.prefs.mk"
.if ${MACHINE_ARCH} == "alpha" || \
    ${MACHINE_ARCH} == "i386" || \
    ${MACHINE_ARCH} == "x86_64"
GCC_REQD+=		3.3
.else
GCC_REQD+=		4.2.1
.endif

# configure check is fooled by trap & emulate of unaligned access on alpha
.if (${MACHINE_ARCH} == "alpha")
CONFIGURE_ARGS+= --enable-aligned
.endif

.if !empty(OPSYS:M*BSD) || ${OPSYS} == "DragonFly" || ${OPSYS} == "Darwin"
CONFIGURE_ARGS+=	--with-kqueue
.endif

.include "../../mk/compiler.mk"

# See http://libtorrent.rakshasa.no/ticket/96
.if !empty(CC_VERSION:Mgcc-4.*)
CXXFLAGS+=	-fpermissive -fno-strength-reduce -fno-thread-jumps \
		-fno-inline -fforce-addr
.endif

.include "../../security/openssl/buildlink3.mk"
.if !exists(${BUILDLINK_PREFIX.openssl}/lib/pkgconfig/openssl.pc)
OPENSSL_CFLAGS=	-I${BUILDLINK_PREFIX.openssl}/include
OPENSSL_LIBS=	-L${BUILDLINK_PREFIX.openssl}/lib \
		-W,-lR${BUILDLINK_PREFIX.openssl}/lib

CONFIGURE_ENV+=	OPENSSL_CFLAGS=${OPENSSL_CFLAGS:Q}
CONFIGURE_ENV+=	OPENSSL_LIBS=${OPENSSL_LIBS:Q}
.endif

.include "../../devel/libsigc++/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
