# $NetBSD: Makefile,v 1.11 2011/10/17 09:27:48 hiramatsu Exp $

DISTNAME=		Number-Latin-1.01
PKGNAME=		p5-${DISTNAME}
PKGREVISION=		5
CATEGORIES=		math perl5
MASTER_SITES=		${MASTER_SITE_PERL_CPAN:=Number/}

MAINTAINER=		norm@sandbox.org.uk
HOMEPAGE=		http://search.cpan.org/dist/Number-Latin
COMMENT=		Perl module for "lower/upper-latin" numbering system
LICENSE=		${PERL5_LICENSE}

PKG_DESTDIR_SUPPORT=	user-destdir

PERL5_PACKLIST=		auto/Number/Latin/.packlist

.include "../../lang/perl5/module.mk"
.include "../../mk/bsd.pkg.mk"
