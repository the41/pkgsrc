# $NetBSD: Makefile,v 1.8 2011/11/01 06:02:35 sbd Exp $
#

DISTNAME=	Gnome2-VFS-1.081
PKGNAME=	p5-${DISTNAME}
PKGREVISION=	7
CATEGORIES=	graphics perl5
MASTER_SITES=	${MASTER_SITE_SOURCEFORGE:=gtk2-perl/}

MAINTAINER=	pkgsrc-users@NetBSD.org
HOMEPAGE=	http://gtk2-perl.sourceforge.net/
COMMENT=	Perl bindings for the Gnome virtual file system
#LICENSE=	gnu-lgpl-v2

DEPENDS+=	p5-ExtUtils-Depends>=0.300:../../devel/p5-ExtUtils-Depends
DEPENDS+=	p5-ExtUtils-PkgConfig>=1.00:../../devel/p5-ExtUtils-PkgConfig

PKG_DESTDIR_SUPPORT=	user-destdir

MAKE_JOBS_SAFE=	no

USE_TOOLS+=	pkg-config

PERL5_PACKLIST=	auto/Gnome2/VFS/.packlist

.include "../../lang/perl5/module.mk"
.include "../../sysutils/gnome-vfs/buildlink3.mk"
.include "../../devel/p5-glib2/buildlink3.mk"
.include "../../mk/bsd.pkg.mk"
