# $NetBSD: Makefile,v 1.7 2011/04/08 22:45:43 morr Exp $
#

DISTNAME=	nsca-2.7.2
PKGNAME=	nagios-${DISTNAME}
CATEGORIES=	net sysutils
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=nagios/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://www.nagios.org/
COMMENT=	Remote/passive network service for nagios

PKG_DESTDIR_SUPPORT=	user-destdir

EGDIR=		${PREFIX}/share/examples/nagios
EGFILES=	nsca.cfg

USE_TOOLS+=	perl

.for files in ${EGFILES}
CONF_FILES+=	${EGDIR}/${files} ${PKG_SYSCONFDIR}/${files}
.endfor

.include "../../net/nagios-base/Makefile.common"

CONFIGURE_ARGS+=	--with-nsca-user=${NAGIOS_USER}
CONFIGURE_ARGS+=	--with-nsca-grp=${NAGIOS_GROUP}

PKG_GROUPS+=			${NAGIOS_GROUP}
PKG_USERS+=			${NAGIOS_USER}:${NAGIOS_GROUP}
PKG_GECOS.${NAGIOS_USER}=	Nagios Runtime User
INSTALLATION_DIRS+=		bin

BUILD_DEFS+=			NAGIOS_USER NAGIOS_GROUP

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/nsca ${DESTDIR}${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/src/send_nsca ${DESTDIR}${PREFIX}/bin
	${INSTALL_DATA_DIR} ${DESTDIR}${EGDIR}
	${INSTALL_DATA} ${WRKSRC}/sample-config/nsca.cfg ${DESTDIR}${EGDIR}

.include "../../security/libmcrypt/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
