# $NetBSD: Makefile,v 1.7 2008/03/04 06:59:04 jlam Exp $
#

DISTNAME=		book_1.01.pgn
PKGNAME=		${CHESS_ENGINE}-book-1.01
PKGREVISION=		1
CATEGORIES=		games
MASTER_SITES=		${MASTER_SITE_GNU:=chess/}
EXTRACT_SUFX=		.gz

MAINTAINER=		pkgsrc-users@NetBSD.org
HOMEPAGE=		http://www.gnu.org/software/chess/
COMMENT=		Chess opening book for GNU Chess (default)

DEPENDS+=		gnuchess>=5.07:../../games/gnuchess

CONFLICTS+=		gnuchess-book-*

PKG_DESTDIR_SUPPORT=	user-destdir

WRKSRC=			${WRKDIR}
CHESS_ENGINE=		gnuchess
NO_CONFIGURE=		yes

PLIST_SUBST+=		CHESS_ENGINE=${CHESS_ENGINE:Q}
PLIST_SUBST+=		BOOK_FILE=${BOOK_FILE:Q}

BOOKDIR=		${PREFIX}/lib/${CHESS_ENGINE}
PGN_FILE=		${DISTNAME}
BOOK_FILE=		book.dat

do-build:
	@${ECHO} "book add ${WRKSRC}/${PGN_FILE}" > ${WRKSRC}/makebook.gnuchess
	@${ECHO} "quit" >> ${WRKSRC}/makebook.gnuchess
	@cd ${WRKSRC} && ${CAT} makebook.gnuchess | ${LOCALBASE}/bin/gnuchess

do-install:
	${INSTALL_DATA_DIR} ${DESTDIR}${BOOKDIR}
	${INSTALL_DATA} ${WRKSRC}/${BOOK_FILE} ${DESTDIR}${BOOKDIR}

.include "../../mk/bsd.pkg.mk"
